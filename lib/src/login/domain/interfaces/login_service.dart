import '../token_entity.dart';

abstract class LoginService {
  Future<TokenEntity> login({required String login, required String password});
}
