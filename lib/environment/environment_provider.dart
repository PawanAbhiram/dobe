import 'package:dobe/environment/environment_config.dart';
import 'package:dobe/environment/environment_service.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class EnvironmentProvider extends ChangeNotifier {
  static final EnvironmentProvider _instance = EnvironmentProvider._internal();

  factory EnvironmentProvider() {
    return _instance;
  }

  EnvironmentProvider._internal();

  Environment currentEnvironment = Environment.DEV;
  final EnvironmentService environmentService = EnvironmentService();

  final BehaviorSubject<EnvironmentConfig> _environmentSubject =
      BehaviorSubject.seeded(const EnvironmentConfig(baseUrl: "", apiKey: ""));

  Stream<EnvironmentConfig> get environmentStream => _environmentSubject.stream;

  Future<void> fetchEnvironment() async {
    final config = await EnvironmentService.getEnvironmentConfig(currentEnvironment);
    _environmentSubject.add(config);

  }
Future<void> setEnvironment(Environment environment) async {
  final config = await EnvironmentService.getEnvironmentConfig(environment);
  _environmentSubject.add(config);
}

  Future<void> switchEnvironment(Environment environment) async {
    currentEnvironment = environment;
    await setEnvironment(environment);
    notifyListeners();
  }

  @override
  void dispose() {
    _environmentSubject.close();
    super.dispose();
  }
}
