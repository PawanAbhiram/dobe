import 'package:dobe/environment/environment_config.dart';

class EnvironmentService {
  static Future<EnvironmentConfig> getEnvironmentConfig(Environment environment) async {
    switch (environment) {
      case Environment.DEV:
        return const EnvironmentConfig(
          baseUrl: "https://dog.ceo/api/",
          apiKey: "YOUR_DEV_API_KEY",
        );
      case Environment.STAGING:
        return const EnvironmentConfig(
          baseUrl: "https://api.staging.yourdomain.com",
          apiKey: "YOUR_STAGING_API_KEY",
        );
      case Environment.PRODUCTION:
        return const EnvironmentConfig(
          baseUrl: "https://api.production.yourdomain.com",
          apiKey: "YOUR_PRODUCTION_API_KEY",
        );
    }
  }
}
