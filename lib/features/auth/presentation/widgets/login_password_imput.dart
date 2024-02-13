import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class LoginPasswordImput extends StatelessWidget {
  const LoginPasswordImput({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return FlutCinematicTextField.password(
      title: texts.auth.password,
      hintText: texts.auth.typeYourPassword,
      prefixIcon: FlutCinematicIcons.key,
      controller: passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FormValidator.passwordValid(
        value,
        passwordRequired: texts.auth.fieldRequired,
        passwordShort: texts.auth.passwordInvalid,
      ),
    );
  }
}
