import 'package:injectable/injectable.dart';

import 'entities/team.dart';
import 'interfaces/teams_repository.dart';

@singleton
class GetSelectedTeamUseCase {
  final TeamsRepository _teamsRepository;

  @factoryMethod
  GetSelectedTeamUseCase({required TeamsRepository teamsRepository})
      : _teamsRepository = teamsRepository;

  Future<Team?> getSelectedTeam() async {
    final selectedTeamId = await _teamsRepository.getSelectedTeamId();
    if (selectedTeamId != null) {
      return _teamsRepository.getTeamById(selectedTeamId);
    }
    return null;
  }
}
