import 'package:injectable/injectable.dart';

import 'entities/user_entity.dart';
import 'interfaces/user_repository.dart';

@singleton
class CheckStoredUserUseCase {
  final UserRepository _userRepository;

  @factoryMethod
  CheckStoredUserUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<UserEntity?> checkStoredUser() async {
    try {
      final storedUser = await _userRepository.getUser();
      return storedUser;
    } catch (e) {
      return null;
    }
  }
}
