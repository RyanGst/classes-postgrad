import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'models/user_model.dart';

part 'user_api.g.dart';

@singleton
@RestApi()
abstract class UserApi {
  @factoryMethod
  factory UserApi(Dio dio) = _UserApi;

  @GET("/v4/users/me")
  Future<UserModel> fetchUser();
}
