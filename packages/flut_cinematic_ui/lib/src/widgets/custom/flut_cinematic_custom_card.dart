import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicCustomCard extends StatelessWidget {
  const FlutCinematicCustomCard({
    required this.child,
    super.key,
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.onPressed,
    this.backgroundColor,
    this.externalPadding = edgeInsetsZero,
    this.height,
  });
  final Color? borderColor;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry externalPadding;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: externalPadding,
        child: InkWell(
          onTap: onPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ?? Palette.white.withOpacity(.2),
              ),
              borderRadius: borderRadius ?? borderRadius12,
              color: backgroundColor,
            ),
            child: Padding(
              padding: padding ?? edgeInsetsH12.add(edgeInsetsV10),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
