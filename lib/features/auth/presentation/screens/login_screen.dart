import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen._();

  static Widget builder(BuildContext _, GoRouterState __) {
    return const LoginScreen._();
  }

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void _listener(AuthState? _, AuthState authState) {
    switch (authState) {
      case Authenticated():
        context.pop();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    if (kDebugMode) {
      emailController.text = 'brayan@gmail.com';
      passwordController.text = 'Test123';
    }
    ref.listen(authProvider, _listener);
    return FlutCinematicBaseScreen(
      body: Padding(
        padding: edgeInsetsH20,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                FlutCinematicTextField(
                  title: texts.auth.email,
                  hintText: texts.auth.typeYourEmail,
                  prefixIcon: FlutCinematicIcons.email,
                  controller: emailController,
                ),
                gap24,
                FlutCinematicTextField.password(
                  title: texts.auth.password,
                  hintText: texts.auth.typeYourPassword,
                  prefixIcon: FlutCinematicIcons.key,
                  controller: passwordController,
                ),
                gap20,
                FlutCinematicPrimaryButton(
                  text: texts.auth.loginNow,
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    showLoader(
                      context,
                      ref.read(authProvider.notifier).login(email, password),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
