import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicAppBar extends StatelessWidget {
  const FlutCinematicAppBar({
    required this.title,
    required this.subTitle,
    super.key,
    this.actions = const [],
    this.button,
    this.onArrowDown,
    this.onBack,
  });
  final String title;
  final String subTitle;
  final List<Widget> actions;
  final Widget? button;
  final VoidCallback? onArrowDown;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: edgeInsetsH20.add(edgeInsetsV16),
          child: Row(
            children: [
              if (onBack != null) ...[
                FlutCinematicIconButton(
                  iconData: FlutCinematicIcons.arrowBack,
                  onPressed: onBack!,
                  size: FlutCinematicIconSize.medium,
                  fontWeight: AppFontWeight.regular,
                ),
                space10,
              ],
              Expanded(
                child: Hero(
                  tag: 'header-appbar',
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: title,
                        style: context.textTheme.bodyLarge,
                        children: [
                          TextSpan(
                            text: subTitle,
                            style: context.textTheme.displayLarge,
                          ),
                          if (onArrowDown != null) ...[
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.top,
                              child: FlutCinematicIcon(
                                padding: edgeInsetL6,
                                icon: FlutCinematicIcons.arrowDown,
                                color: Palette.red,
                                width: 16,
                                size: FlutCinematicIconSize.medium,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ...actions,
            ],
          ),
        ),
        if (button != null) button!,
        const FlutCinematicDivider(),
      ],
    );
  }
}
