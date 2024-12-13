
import 'package:dio/dio.dart';

import '../../login/domain/interfaces/login_repository.dart';
import '../di/injector.dart';

class TokenInsertingInterceptor extends Interceptor {
  final LoginRepository tokenRepository = Injector.instance.get();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenEntity = await tokenRepository.getToken();

    if (tokenEntity != null) {
      options.headers['Authorization'] = 'JWT ${tokenEntity.token}';
    }

    super.onRequest(options, handler);
  }
}
