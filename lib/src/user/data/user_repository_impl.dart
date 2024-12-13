import 'package:injectable/injectable.dart';

import '../domain/interfaces/user_repository.dart';
import '../domain/entities/user_entity.dart';
import 'user_api.dart';
import 'user_storage.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;
  final UserStorage _userStorage;

  @factoryMethod
  UserRepositoryImpl({
    required UserApi userApi,
    required UserStorage userStorage,
  })  : _userApi = userApi,
        _userStorage = userStorage;

  @override
  Future<void> deleteUser() async {
    await _userStorage.deleteUser();
  }

  @override
  Future<UserEntity> getUser() async {
    return await _userStorage.getUser() ?? _fetchAndStoreUser();
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    await _userStorage.saveUser(user);
  }

  Future<UserEntity> _fetchAndStoreUser() async {
    final user = await _userApi.fetchUser();
    final userEntity = user.toEntity();
    await _userStorage.saveUser(userEntity);
    return userEntity;
  }
}
