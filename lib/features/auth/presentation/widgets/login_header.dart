import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          texts.auth.readyForPopcorn,
          style: context.textTheme.bodyLarge,
        ),
        gap4,
        RichText(
          text: TextSpan(
            text: texts.auth.enterYour,
            style: context.textTheme.headlineLarge,
            children: [
              TextSpan(
                text: texts.auth.fildLoverWorld,
                style: context.textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        gap20,
      ],
    );
  }
}
