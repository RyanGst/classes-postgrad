import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
    required this.twiageClient,
    required this.platform,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  final String username;
  final String password;
  final String twiageClient;
  final String platform;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
