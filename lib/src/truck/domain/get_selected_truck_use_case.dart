import 'package:injectable/injectable.dart';
import 'package:riverpodexample/src/core/util/iterable_extensions.dart';

import '../../team/domain/get_selected_team_use_case.dart';
import 'entities/truck.dart';
import 'interfaces/selected_truck_repository.dart';

@singleton
class GetSelectedTruckUseCase {
  final SelectedTruckRepository _selectedTruckRepository;
  final GetSelectedTeamUseCase _getSelectedTeamUseCase;

  @factoryMethod
  GetSelectedTruckUseCase({
    required GetSelectedTeamUseCase getSelectedTeamUseCase,
    required SelectedTruckRepository selectedTruckRepository,
  })  : _getSelectedTeamUseCase = getSelectedTeamUseCase,
        _selectedTruckRepository = selectedTruckRepository;

  Future<Truck?> getSelectedTruck() async {
    final selectedTruckId =
        await _selectedTruckRepository.getSelectedTruckId();
    if (selectedTruckId != null) {
      final selectedTeam = await _getSelectedTeamUseCase.getSelectedTeam();
      return selectedTeam?.trucks
          .firstWhereOrNull((truck) => truck.id == selectedTruckId);
    }
    return null;
  }
}
