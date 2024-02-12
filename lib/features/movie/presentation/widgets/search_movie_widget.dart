import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsV30.add(edgeInsetsB6).add(edgeInsetsH60),
      child: Column(
        children: [
          const FlutCinematicIcon(
            icon: FlutCinematicIcons.book,
            color: Palette.red,
            rawSize: 32,
            fontWeight: AppFontWeight.regular,
          ),
          gap8,
          if (text != null)
            Text(
              text!,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          else ...[
            Text(
              'Use the search bar to filter by title'.hardCode,
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            gap8,
            Text(
              'Get ready for a personalized movie experience!'.hardCode,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
