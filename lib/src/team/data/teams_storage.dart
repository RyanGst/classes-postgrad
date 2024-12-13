import 'package:injectable/injectable.dart';

import '../domain/entities/team.dart';

@singleton
class TeamsStorage {
  String? _selectedTeamId;

  Future<void> clear() async {
    _selectedTeamId = null;
  }

  Future<Team?> getTeamById(String id) async {
    return null;
  }

  Future<void> saveTeam(Team team) async {
  }

  Future<void> saveSelectedTeamId(String id) async {
    _selectedTeamId = id;
  }

  Future<String?> getSelectedTeamId() async {
    return _selectedTeamId;
  }
}
