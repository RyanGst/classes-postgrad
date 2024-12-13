
import 'package:injectable/injectable.dart';

import '../domain/interfaces/login_repository.dart';
import '../domain/token_entity.dart';

@Singleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  TokenEntity? _token;

  @override
  Future<void> deleteToken() async {
    _token = null;
  }

  @override
  Future<TokenEntity?> getToken() async {
    return _token;
  }

  @override
  Future<void> saveToken(TokenEntity token) async {
    _token = token;
  }
}
