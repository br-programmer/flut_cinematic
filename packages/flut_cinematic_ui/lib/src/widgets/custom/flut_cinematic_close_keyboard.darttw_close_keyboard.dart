import 'package:flutter/material.dart';

class FlutCinematicCloseKeyboard extends StatelessWidget {
  const FlutCinematicCloseKeyboard({required this.app, super.key});
  final MaterialApp app;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        final hasPrimaryFocus = currentFocus.hasPrimaryFocus;
        final focusedChild = currentFocus.focusedChild;
        if (!hasPrimaryFocus && focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        FocusScope.of(context).unfocus();
      },
      child: app,
    );
  }
}
