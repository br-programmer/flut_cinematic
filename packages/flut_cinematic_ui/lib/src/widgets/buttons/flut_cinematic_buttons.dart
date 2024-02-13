import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

enum ButtonSize {
  small,
  medium,
  large,
}

extension on ButtonSize {
  double get fontSize {
    switch (this) {
      case ButtonSize.small:
        return 13;
      case ButtonSize.medium:
        return 14;
      case ButtonSize.large:
        return 16;
    }
  }

  double get height {
    switch (this) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 40;
      case ButtonSize.large:
        return 52;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.small:
        return edgeInsetsH4;
      case ButtonSize.medium:
      case ButtonSize.large:
        return edgeInsetsH10;
    }
  }
}

class FlutCinematicBaseButton extends StatelessWidget {
  const FlutCinematicBaseButton({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    this.textColor,
    this.iconColor,
    this.icon,
    this.size = ButtonSize.medium,
    this.centered = true,
    this.textStyle,
    this.padding,
    this.child,
    this.rawSize,
    this.borderRadius = borderRadius5,
  });

  final void Function()? onPressed;
  final Color? color;
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final IconData? icon;
  final ButtonSize size;
  final bool centered;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? rawSize;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return ClipRRect(
      borderRadius: borderRadius5,
      child: SizedBox(
        height: size.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            disabledBackgroundColor: Palette.white.withOpacity(.1),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            padding: padding ?? size.padding,
          ),
          onPressed: onPressed,
          child: child ??
              Row(
                mainAxisAlignment: centered
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (icon != null) ...[
                    FlutCinematicIcon(
                      icon: icon!,
                      color: iconColor,
                      rawSize: rawSize,
                    ),
                    if (text != null) space10,
                  ],
                  if (text != null) ...[
                    Text(
                      text!,
                      style: textStyle ??
                          context.textTheme.titleLarge?.copyWith(
                            color: enabled
                                ? textColor
                                : Palette.white.withOpacity(.1),
                            fontSize: size.fontSize,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                    ),
                  ],
                ],
              ),
        ),
      ),
    );
  }
}

class FlutCinematicPrimaryButton extends FlutCinematicBaseButton {
  const FlutCinematicPrimaryButton({
    super.key,
    super.onPressed,
    super.text,
    super.icon,
    super.size = ButtonSize.large,
    super.centered = true,
    super.textStyle,
    super.textColor,
    super.padding,
    super.color = Palette.red,
    super.child,
    super.borderRadius = borderRadius12,
  });

  @override
  Widget build(BuildContext context) {
    return FlutCinematicBaseButton(
      centered: centered,
      padding: padding,
      icon: icon,
      size: size,
      text: text,
      onPressed: onPressed,
      textStyle: textStyle,
      textColor: textColor,
      color: color,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
