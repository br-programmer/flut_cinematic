import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DateTimeAndRoomSelected extends HookConsumerWidget {
  const DateTimeAndRoomSelected({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(ticketProvider);
    final date = ticketState.date;
    final time = ticketState.time;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: edgeInsetsB16,
        child: Row(
          children: [
            space20,
            FlutCinematicCustomCard(
              child: Row(
                children: [
                  FlutCinematicIcon(
                    icon: FlutCinematicIcons.calendar,
                    size: FlutCinematicIconSize.medium,
                    color: Palette.white.withOpacity(.4),
                  ),
                  space6,
                  RichText(
                    text: TextSpan(
                      text: date!.formatShort(
                        LocaleSettings.currentLocale.languageCode,
                      ),
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                      ),
                      children: [
                        TextSpan(
                          text: ' ${texts.misc.at} ',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: AppFontWeight.regular,
                            color: Palette.white.withOpacity(.6),
                          ),
                        ),
                        TextSpan(
                          text: time!
                              .myHour(LocaleSettings.currentLocale.languageCode)
                              .replaceAll(' ', '')
                              .toLowerCase(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            space8,
            FlutCinematicCustomCard(
              child: Row(
                children: [
                  FlutCinematicIcon(
                    icon: FlutCinematicIcons.room,
                    size: FlutCinematicIconSize.medium,
                    color: Palette.white.withOpacity(.4),
                  ),
                  space6,
                  RichText(
                    text: TextSpan(
                      text: '${texts.misc.room} 2',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            space20,
          ],
        ),
      ),
    );
  }
}
