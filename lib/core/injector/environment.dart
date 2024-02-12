import 'package:firebase_core/firebase_core.dart';
import 'package:flut_cinematic/firebase_options/firebase_options.dart';
import 'package:flut_cinematic/firebase_options/firebase_options_dev.dart'
    as default_options_dev;
import 'package:flut_cinematic/firebase_options/firebase_options_stg.dart'
    as default_options_stg;

enum Environment {
  dev(),
  staging(),
  prod();

  const Environment();

  bool get enableLogging => this != Environment.prod;
  String get apiKey => const String.fromEnvironment('apiKey');
  String get baseUrl => const String.fromEnvironment('baseUrl');

  FirebaseOptions get options {
    switch (this) {
      case Environment.dev:
        return default_options_dev.DefaultFirebaseOptions.currentPlatform;
      case Environment.staging:
        return default_options_stg.DefaultFirebaseOptions.currentPlatform;
      case Environment.prod:
        return DefaultFirebaseOptions.currentPlatform;
    }
  }
}
