import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

const leters = <int, String>{
  0: 'A',
  1: 'B',
  3: 'C',
  4: 'D',
  5: 'E',
  6: 'F',
  8: 'G',
  9: 'H',
  10: 'I',
  11: 'J',
};

class LetterRowIndicator extends StatelessWidget {
  const LetterRowIndicator({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsR14.add(edgeInsetsB4),
      child: Text(
        leters[index] ?? '',
        style: context.textTheme.bodyLarge,
      ),
    );
  }
}
