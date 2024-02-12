import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicDot extends StatelessWidget {
  const FlutCinematicDot({
    super.key,
    this.dimension = 8,
    this.color = Palette.white,
  });
  final double dimension;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
