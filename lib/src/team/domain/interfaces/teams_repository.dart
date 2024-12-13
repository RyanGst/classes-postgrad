
import '../entities/team.dart';

abstract class TeamsRepository {
  Future<void> saveTeam(Team team);
  Future<Team> getTeamById(String id);
  Future<void> setSelectedTeamId(String id);
  Future<String?> getSelectedTeamId();
  Future<void> clear();
}
