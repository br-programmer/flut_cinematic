import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

enum FlutCinematicIconSize {
  small(12),
  medium(16),
  large(20),
  bigger(24);

  const FlutCinematicIconSize(this.size);
  final double size;
}

class FlutCinematicIcon extends StatelessWidget {
  const FlutCinematicIcon({
    required this.icon,
    super.key,
    this.rawSize,
    this.size = FlutCinematicIconSize.bigger,
    this.color = Palette.white,
    this.fontWeight = AppFontWeight.semiBold,
    this.alignment = Alignment.center,
    this.padding = edgeInsetsZero,
    this.width,
  });

  final IconData icon;
  final Color? color;
  final double? rawSize;
  final FlutCinematicIconSize size;
  final FontWeight fontWeight;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: padding,
        child: Align(
          alignment: alignment,
          child: Text(
            String.fromCharCode(icon.codePoint),
            style: TextStyle(
              color: color,
              inherit: false,
              fontSize: rawSize ?? size.size,
              fontWeight: fontWeight,
              fontFamily: FontFamily.flutCinematic,
              package: FlutCinematicUI.package,
            ),
          ),
        ),
      ),
    );
  }
}
