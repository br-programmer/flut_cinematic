import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicIconButton extends StatelessWidget {
  const FlutCinematicIconButton({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconData,
    this.rawSize,
    this.size = FlutCinematicIconSize.bigger,
    this.color = Palette.white,
    this.fontWeight = AppFontWeight.semiBold,
    this.padding = edgeInsetsZero,
    this.width,
  });

  final IconData? iconData;
  final Color? color;
  final double? rawSize;
  final FlutCinematicIconSize size;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final double? width;
  final Widget? icon;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        onPressed: onPressed,
        splashColor: Colors.transparent,
        splashRadius: 1,
        style: IconButton.styleFrom(splashFactory: NoSplash.splashFactory),
        constraints: const BoxConstraints(maxHeight: 40, maxWidth: 24),
        icon: icon ??
            FlutCinematicIcon(
              icon: iconData!,
              rawSize: rawSize,
              size: size,
              fontWeight: fontWeight,
              color: color,
            ),
      ),
    );
  }
}
