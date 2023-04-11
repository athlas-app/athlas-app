import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'GATEWAY_URL')
  static final gatewayUrl = _Env.gatewayUrl;
}
