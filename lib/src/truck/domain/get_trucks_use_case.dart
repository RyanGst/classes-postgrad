import 'package:injectable/injectable.dart';

import '../../team/domain/get_selected_team_use_case.dart';
import 'entities/truck.dart';

@singleton
class GetTrucksUseCase {
  final GetSelectedTeamUseCase _getSelectedTeamUseCase;

  @factoryMethod
  GetTrucksUseCase({ required GetSelectedTeamUseCase getSelectedTeamUseCase }): _getSelectedTeamUseCase = getSelectedTeamUseCase;

  Future<List<Truck>> getTrucks() async {
    final team = await _getSelectedTeamUseCase.getSelectedTeam();
    return team?.trucks ?? [];
  }
}
