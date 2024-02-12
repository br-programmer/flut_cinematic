enum Environment {
  dev(),
  staging(),
  prod();

  const Environment();

  bool get enableLogging => this != Environment.prod;
  String get apiKey => const String.fromEnvironment('apiKey');
  String get baseUrl => const String.fromEnvironment('baseUrl');
}
