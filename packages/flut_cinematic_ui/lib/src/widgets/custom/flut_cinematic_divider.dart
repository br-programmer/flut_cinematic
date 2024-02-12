import 'package:flutter/material.dart';

class FlutCinematicDivider extends StatelessWidget {
  const FlutCinematicDivider({super.key, this.useHero = true});
  final bool useHero;

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(
      height: 1,
      child: ColoredBox(
        color: Colors.white.withOpacity(.1),
      ),
    );
    if (useHero) {
      return Hero(
        tag: 'flut-cinematic-divider',
        child: divider,
      );
    }
    return divider;
  }
}
