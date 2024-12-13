import 'package:injectable/injectable.dart';

import '../domain/interfaces/login_service.dart';
import '../domain/token_entity.dart';
import 'login_api.dart';
import 'models/login_request.dart';

@Singleton(as: LoginService)
class LoginServiceImpl implements LoginService {
  final LoginApi _api;

  @factoryMethod
  LoginServiceImpl({ required LoginApi api }): _api = api;

  @override
  Future<TokenEntity> login({required String login, required String password}) async {
    final loginRequest = LoginRequest(
        username: login,
        password: password,
        twiageClient: "ems",
        platform: "android");

    final response = await _api.login(loginRequest);
    return response.toEntity();
  }
}
