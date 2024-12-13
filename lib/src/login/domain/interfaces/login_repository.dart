
import '../token_entity.dart';

abstract class LoginRepository {
  Future<void> deleteToken();

  Future<TokenEntity?> getToken() ;

  Future<void> saveToken(TokenEntity token);
}
