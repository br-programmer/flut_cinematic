import 'dart:ui';

import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchTrailerButton extends HookConsumerWidget {
  const WatchTrailerButton({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(videoProvider(movieId))) {
      LoadedVideoState(videos: final videos) => Positioned(
          left: 12,
          bottom: 12,
          child: ClipRRect(
            borderRadius: borderRadius8,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: FlutCinematicBaseButton(
                onPressed: () {},
                color: Palette.white.withOpacity(.2),
                padding: edgeInsetsH8.add(edgeInsetsV4),
                child: Row(
                  children: [
                    const FlutCinematicIcon(
                      icon: FlutCinematicIcons.play,
                      size: FlutCinematicIconSize.large,
                    ),
                    space4,
                    Text(
                      'Watch trailer',
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}