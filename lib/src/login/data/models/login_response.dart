import 'package:json_annotation/json_annotation.dart';
import 'package:riverpodexample/src/login/domain/token_entity.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({required this.expirationDate, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  final DateTime expirationDate;
  final String token;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  TokenEntity toEntity() {
    return TokenEntity(token: token, tokenExpiration: expirationDate);
  }
}
