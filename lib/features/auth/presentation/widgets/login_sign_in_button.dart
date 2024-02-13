import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class LoginSignInButton extends StatelessWidget {
  const LoginSignInButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlutCinematicPrimaryButton(
      text: texts.auth.loginNow,
      onPressed: onPressed,
    );
  }
}
