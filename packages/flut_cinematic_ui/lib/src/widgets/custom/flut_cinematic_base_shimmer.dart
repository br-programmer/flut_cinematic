import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlutCinematicBaseShimmer extends StatelessWidget {
  const FlutCinematicBaseShimmer({
    required this.child,
    super.key,
    this.firstColor,
    this.secondColor,
  });
  final Widget child;
  final Color? firstColor;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      period: duration1800ms,
      gradient: LinearGradient(
        colors: [
          firstColor ?? Palette.grey,
          secondColor ?? Palette.grey.withOpacity(.9),
        ],
      ),
      child: child,
    );
  }
}
