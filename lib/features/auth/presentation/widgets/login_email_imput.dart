import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class LoginEmailImput extends StatelessWidget {
  const LoginEmailImput({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return FlutCinematicTextField(
      title: texts.auth.email,
      hintText: texts.auth.typeYourEmail,
      prefixIcon: FlutCinematicIcons.email,
      controller: emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FormValidator.email(
        value,
        emailInvalid: texts.auth.invalidEmail,
        emailRequired: texts.auth.fieldRequired,
      ),
    );
  }
}
