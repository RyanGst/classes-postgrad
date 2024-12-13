import 'package:injectable/injectable.dart';

import 'entities/team.dart';
import 'interfaces/teams_repository.dart';

@singleton
class SelectTeamUseCase {
  final TeamsRepository _teamRepository;

  @factoryMethod
  SelectTeamUseCase({required TeamsRepository teamsRepository})
      : _teamRepository = teamsRepository;

  Future<void> selectTeam(Team team) async {
    _teamRepository.setSelectedTeamId(team.id);
  }
}
