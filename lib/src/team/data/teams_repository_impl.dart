
import 'package:injectable/injectable.dart';

import '../domain/entities/team.dart';
import '../domain/interfaces/teams_repository.dart';
import 'teams_service.dart';
import 'teams_storage.dart';

@Singleton(as: TeamsRepository)
class TeamsRepositoryImpl implements TeamsRepository {
  final TeamsService _teamsService;
  final TeamsStorage _teamsStorage;

  TeamsRepositoryImpl({ required TeamsService teamsService, required TeamsStorage teamsStorage, }):
        _teamsService = teamsService,
        _teamsStorage = teamsStorage;

  @override
  Future<void> clear() async {
    await _teamsStorage.clear();
  }

  @override
  Future<Team> getTeamById(String id) async {
    final cachedTeam = await _teamsStorage.getTeamById(id);
    if (cachedTeam != null) {
      return cachedTeam;
    }
    final fetchedTeam = await _teamsService.getTeamById(id);
    await _teamsStorage.saveTeam(fetchedTeam);
    return fetchedTeam;
  }

  @override
  Future<void> setSelectedTeamId(String id) async {
    await _teamsStorage.saveSelectedTeamId(id);
  }

  @override
  Future<String?> getSelectedTeamId() async {
    return _teamsStorage.getSelectedTeamId();
  }

  @override
  Future<void> saveTeam(Team team) async {
    await _teamsStorage.saveTeam(team);
  }
}
