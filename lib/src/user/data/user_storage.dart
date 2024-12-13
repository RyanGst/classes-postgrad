import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/entities/user_entity.dart';

@singleton
class UserStorage {
  static const String _userKey = 'user_data';
  final SharedPreferences _prefs;

  UserStorage(this._prefs);

  @factoryMethod
  static Future<UserStorage> create() async {
    final prefs = await SharedPreferences.getInstance();
    return UserStorage(prefs);
  }

  Future<void> deleteUser() async {
    await _prefs.remove(_userKey);
  }

  Future<UserEntity?> getUser() async {
    final userJson = _prefs.getString(_userKey);
    if (userJson == null) return null;

    try {
      final Map<String, dynamic> userData = json.decode(userJson);
      return UserEntity.fromJson(userData);
    } catch (e) {
      print('Error decoding user data: $e');
      return null;
    }
  }

  Future<void> saveUser(UserEntity user) async {
    final userJson = json.encode(user.toJson());
    await _prefs.setString(_userKey, userJson);
  }
}
