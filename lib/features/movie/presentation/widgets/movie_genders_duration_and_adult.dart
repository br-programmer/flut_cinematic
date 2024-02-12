import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MovieGendersDurationAndAdult extends HookConsumerWidget {
  const MovieGendersDurationAndAdult({
    super.key,
    this.adult = false,
    this.genres = const [],
    this.runtime,
    this.firstColor,
    this.secondColor,
  });

  final bool adult;
  final int? runtime;
  final List<Gender> genres;
  final Color? firstColor;
  final Color? secondColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      runSpacing: 4,
      spacing: 4,
      children: [
        if (runtime == null) ...[
          ...List.generate(
            2,
            (index) => FlutCinematicBaseShimmer(
              firstColor: firstColor ?? Palette.dark.withOpacity(.5),
              secondColor: secondColor ?? Palette.dark.withOpacity(.4),
              child: const _Card(
                text: '                  ',
                color: Palette.grey,
              ),
            ),
          ),
        ] else ...[
          if (genres.isNotEmpty)
            _Card(
              icon: FlutCinematicIcons.movies,
              text: genres.first.name,
            ),
          _Card(
            icon: FlutCinematicIcons.clock,
            text: Duration(minutes: runtime!).remainingMinutes,
          ),
          if (adult) const _Card(text: '+18'),
        ],
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    this.icon,
    required this.text,
    this.color,
  });
  final IconData? icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FlutCinematicCustomCard(
      padding: edgeInsetsH8.add(edgeInsetsV4),
      borderRadius: borderRadius8,
      backgroundColor: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            FlutCinematicIcon(
              icon: icon!,
              color: Palette.white.withOpacity(.4),
              size: FlutCinematicIconSize.medium,
            ),
            space4,
          ],
          Text(
            text,
            style: context.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
