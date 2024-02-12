import 'dart:ui' show ImageFilter;

import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

Future<T> showLoader<T>(
  BuildContext context,
  Future<T> future, {
  String? text,
}) async {
  FlutCinematicBlurryLoader.show(context, text: text);
  final result = await future;
  if (context.mounted) {
    FlutCinematicBlurryLoader.hide(context);
  }
  return result;
}

class FlutCinematicBlurryLoader extends StatelessWidget {
  const FlutCinematicBlurryLoader({
    super.key,
    this.fallbackCloseDuration,
    this.tweenAnimationDuration,
    this.text,
  });

  /// if [fallbackCloseDuration] is null, the loader will not close
  /// automatically, otherwise it will close after the given duration
  static void show(
    BuildContext context, {
    Duration? fallbackCloseDuration,
    bool barrierDismissible = true,
    String? text,
  }) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: barrierDismissible,
      builder: (context) => FlutCinematicBlurryLoader(
        fallbackCloseDuration: fallbackCloseDuration,
        text: text,
      ),
    );
  }

  static void hide(BuildContext context) => Navigator.pop(context);

  final Duration? fallbackCloseDuration;
  final Duration? tweenAnimationDuration;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future<void>.delayed(
        fallbackCloseDuration ?? Duration.zero,
        () {
          if (fallbackCloseDuration != null && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
      ),
      builder: (context, _) => TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 5),
        duration: tweenAnimationDuration ?? const Duration(milliseconds: 750),
        builder: (context, value, child) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
          child: child,
        ),
        child: gap0,
      ),
    );
  }
}
