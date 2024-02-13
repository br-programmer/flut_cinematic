import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';

class DateAviable {
  DateAviable._();

  static List<DateTime> get dates {
    return List.generate(
      5,
      (index) => DateTime.now().add(Duration(days: index)),
    );
  }
}

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: edgeInsetsB16,
        child: Row(
          children: [
            space20,
            ...DateAviable.dates.mapList(
              (date) => _DataSelectorItem(dateTime: date),
            ),
            space12,
          ],
        ),
      ),
    );
  }
}

class _DataSelectorItem extends HookConsumerWidget {
  const _DataSelectorItem({required this.dateTime});
  final DateTime dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = dateTime.day == ref.watch(ticketProvider).date?.day;
    final borderColor = selected ? Palette.red : Palette.white.withOpacity(.2);
    final iconColor = selected ? Palette.white : Palette.white.withOpacity(.2);
    return FlutCinematicCustomCard(
      externalPadding: edgeInsetR8,
      onPressed: () {
        ref.read(ticketProvider.notifier).dateSelect(dateTime);
      },
      borderColor: borderColor,
      child: Row(
        children: [
          FlutCinematicIcon(
            icon: FlutCinematicIcons.calendar,
            fontWeight: AppFontWeight.regular,
            color: iconColor,
          ),
          space4,
          RichText(
            text: TextSpan(
              text:
                  '${dateTime.format(LocaleSettings.currentLocale.languageCode)}\n',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: AppFontWeight.semiBold,
              ),
              children: [
                TextSpan(
                  text: dateTime.dayInText(
                    LocaleSettings.currentLocale.languageCode,
                    todayText: texts.movie.today.capitalize(),
                    tomorrowText: texts.movie.tomorrow.capitalize(),
                  ),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: Palette.white.withOpacity(.6),
                  ),
                ),
              ],
            ),
          ),
          space60,
        ],
      ),
    );
  }
}
