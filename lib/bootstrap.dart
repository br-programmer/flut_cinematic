import 'dart:async';
import 'dart:developer';

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
      LocaleSettings.useDeviceLocale();
      final app = ProviderScope(
        overrides: overrides(environment),
        child: const FlutCinematic(),
      );
      GoRouter.optionURLReflectsImperativeAPIs = true;
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
