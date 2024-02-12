import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen._();

  static Widget builder(BuildContext _, GoRouterState __) {
    return const LoginScreen._();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    if (kDebugMode) {
      emailController.text = 'brayan@gmail.com';
      passwordController.text = 'Test123';
    }
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
                  controller: emailController,
                ),
                gap24,
                FlutCinematicTextField.password(
                  title: 'Password'.hardCode,
                  hintText: 'Type your email'.hardCode,
                  prefixIcon: FlutCinematicIcons.key,
                  controller: passwordController,
                ),
                gap20,
                FlutCinematicPrimaryButton(
                  text: 'Login now'.hardCode,
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    ref.read(authProvider.notifier).login(email, password);
                  },
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
