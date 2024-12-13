import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/data/models/error_response.dart';
import 'auth_exception.dart';
import 'interfaces/login_repository.dart';
import 'interfaces/login_service.dart';

@injectable
class LoginUseCase {

  @factoryMethod
  LoginUseCase({
    required LoginService loginService,
    required LoginRepository loginRepository,
  }): _loginService = loginService, _loginRepository = loginRepository;

  final LoginService _loginService;
  final LoginRepository _loginRepository;

  Future<void> login({required String login, required String password}) async {
    try {
      final tokenEntity = await _loginService.login(login: login, password: password);
      await _loginRepository.saveToken(tokenEntity);
    } on DioException catch (e) {
      if (e.message != null) {
        final responseJson = e.response?.data;
        if (responseJson != null) {
          final response = ErrorResponse.fromJson(responseJson);
          throw AuthException(response.message);
        }
        throw AuthException(e.message!);
      }
      rethrow;
    }
  }
}
