enum Environment { DEV, STAGING, PRODUCTION }

class EnvironmentConfig {
  final String baseUrl;
  final String apiKey;

  const EnvironmentConfig({required this.baseUrl, required this.apiKey});
}
