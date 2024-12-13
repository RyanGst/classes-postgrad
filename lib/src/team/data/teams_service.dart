import 'package:injectable/injectable.dart';

import '../domain/entities/team.dart';
import 'team_api.dart';

@singleton
class TeamsService {
  final TeamApi _api;

  @factoryMethod
  TeamsService({ required TeamApi api }): _api = api;

  Future<Team> getTeamById(String id) async {
    final agencyModel = await _api.getAgency(id);
    return agencyModel.toTeam();
  }
}
