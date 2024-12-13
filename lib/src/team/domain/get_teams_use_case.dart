import 'package:injectable/injectable.dart';

import '../../user/domain/interfaces/user_repository.dart';
import 'entities/team.dart';

@singleton
class GetTeamsUseCase {
  final UserRepository _userRepository;

  @factoryMethod
  GetTeamsUseCase({ required UserRepository userRepository }): _userRepository = userRepository;

  Future<List<Team>> getAvailableTeams() async {
    final user = await _userRepository.getUser();
    return user.teams;
  }
}
