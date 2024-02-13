import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class LoginAppleSignIn extends StatelessWidget {
  const LoginAppleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutCinematicPrimaryButton(
      onPressed: () {},
      color: Palette.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svgs.apple.svg(height: 24, width: 24),
          space12,
          Text(
            texts.auth.continueAppleID,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
