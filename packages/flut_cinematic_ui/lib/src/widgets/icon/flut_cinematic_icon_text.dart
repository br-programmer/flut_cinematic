import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicIconText extends StatelessWidget {
  const FlutCinematicIconText({
    required this.icon,
    super.key,
    this.rawSize,
    this.size = FlutCinematicIconSize.bigger,
    this.color = Palette.white,
    this.text,
    this.style,
  });

  final String? text;
  final TextStyle? style;
  final IconData icon;
  final Color? color;
  final double? rawSize;
  final FlutCinematicIconSize size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlutCinematicIcon(
          icon: icon,
          color: color,
          rawSize: rawSize,
          size: size,
        ),
        if (text != null) ...[
          space4,
          Flexible(
            child: Text(
              text!,
              style: style ?? context.textTheme.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}
