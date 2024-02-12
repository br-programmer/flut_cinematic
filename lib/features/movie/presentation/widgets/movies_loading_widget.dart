import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class MoviesLoadingWidget extends StatelessWidget {
  const MoviesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: edgeInsetsH20,
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: .7,
        ),
        itemCount: 6,
        itemBuilder: (_, index) => const ClipRRect(
          borderRadius: borderRadius12,
          child: FlutCinematicBaseShimmer(
            child: ColoredBox(color: Palette.dark),
          ),
        ),
      ),
    );
  }
}
