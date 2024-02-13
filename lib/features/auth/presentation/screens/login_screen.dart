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
  late final formKey = GlobalKey<FormState>();

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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),
                  LoginEmailImput(emailController: emailController),
                  gap24,
                  LoginPasswordImput(passwordController: passwordController),
                  gap20,
                  LoginSignInButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final email = emailController.text;
                        final password = passwordController.text;
                        showLoader(
                          context,
                          ref
                              .read(authProvider.notifier)
                              .login(email, password),
                        );
                      }
                    },
                  ),
                  gap32,
                  Text(
                    '${texts.auth.orYouCan}:',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: Palette.white.withOpacity(.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gap16,
                  const LoginGoogleSignIn(),
                  gap12,
                  const LoginAppleSignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
