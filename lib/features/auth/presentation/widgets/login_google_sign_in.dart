import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class LoginGoogleSignIn extends StatelessWidget {
  const LoginGoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutCinematicPrimaryButton(
      onPressed: () {},
      color: Palette.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svgs.google.svg(height: 24, width: 24),
          space12,
          Text(
            texts.auth.continueGoogle,
            style: context.textTheme.titleLarge?.copyWith(
              color: Palette.dark,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
