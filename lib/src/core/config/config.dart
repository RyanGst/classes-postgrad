import 'package:injectable/injectable.dart';

@singleton
class Config {
  String get baseUrl => "https://api-stage.twiagemed.net";
}
