import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APP_VERSION')
  static const String appVersion = _Env.appVersion;

  @EnviedField(varName: 'GITHUB_REPOSITORY_URL')
  static const String githubRepositoryUrl = _Env.githubRepositoryUrl;

  @EnviedField(varName: 'STACK_EXCHANGE_API_BASE_URL')
  static const String stackExchangeBaseUrl = _Env.stackExchangeBaseUrl;

  @EnviedField(varName: 'STACK_EXCHANGE_API_KEY', obfuscate: true)
  static final String stackExchangeApiKey = _Env.stackExchangeApiKey;

  @EnviedField(varName: 'STACK_EXCHANGE_CLIENT_ID', obfuscate: true)
  static final String stackExchangeClientId = _Env.stackExchangeClientId;
}
