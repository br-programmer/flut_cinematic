import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<void> bootstrap(Environment environment) async {
  final enableLogging = environment.enableLogging;
  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: environment.options);
      LocaleSettings.useDeviceLocale();
      GoRouter.optionURLReflectsImperativeAPIs = true;
      final app = ProviderScope(
        overrides: overrides(environment),
        child: const FlutCinematic(),
      );
      runApp(app);
      FlutterError.onError = (details) {
        if (enableLogging) {
          log(details.exceptionAsString(), stackTrace: details.stack);
        }
      };
    },
    (error, stack) {
      if (enableLogging) {
        log(error.toString(), stackTrace: stack);
      }
    },
  );
}
