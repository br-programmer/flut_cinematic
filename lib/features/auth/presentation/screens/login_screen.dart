import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen._();

  static Widget builder(BuildContext _, GoRouterState __) {
    return const LoginScreen._();
  }

  @override
  Widget build(BuildContext context) {
    return FlutCinematicBaseScreen(
      body: Padding(
        padding: edgeInsetsH20,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '¡Listo para palomitas y entretenimiento!'.hardCode,
                ),
                gap4,
                RichText(
                  text: TextSpan(
                    text: 'Ingresa a tu '.hardCode,
                    style: context.textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: 'mundo Cinéfilo'.hardCode,
                        style: context.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                gap20,
                FlutCinematicTextField(
                  title: 'Email'.hardCode,
                  hintText: 'Type your email'.hardCode,
                  prefixIcon: FlutCinematicIcons.email,
                ),
                gap24,
                FlutCinematicTextField.password(
                  title: 'Password'.hardCode,
                  hintText: 'Type your email'.hardCode,
                  prefixIcon: FlutCinematicIcons.key,
                ),
                gap20,
                FlutCinematicPrimaryButton(
                  text: 'Login now'.hardCode,
                  onPressed: () {},
                ),
                gap32,
                FlutCinematicPrimaryButton(
                  text: 'Continuar con Google'.hardCode,
                  onPressed: () {},
                  color: Palette.white,
                  textColor: Palette.dark,
                ),
                gap12,
                FlutCinematicPrimaryButton(
                  text: 'Continuar con Apple ID'.hardCode,
                  onPressed: () {},
                  color: Palette.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
