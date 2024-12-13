import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'models/login_request.dart';
import 'models/login_response.dart';

part 'login_api.g.dart';

@singleton
@RestApi()
abstract class LoginApi {
  @factoryMethod
  factory LoginApi(Dio dio) = _LoginApi;

  @POST("/v4/auth/signin")
  Future<LoginResponse> login(@Body() LoginRequest credentials);
}
