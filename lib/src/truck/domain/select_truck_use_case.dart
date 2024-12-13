import 'package:injectable/injectable.dart';

import 'entities/truck.dart';
import 'interfaces/selected_truck_repository.dart';

@singleton
class SelectTruckUseCase {
  final SelectedTruckRepository _selectedTruckRepository;

  @factoryMethod
  SelectTruckUseCase({required SelectedTruckRepository selectedTruckRepository})
      : _selectedTruckRepository = selectedTruckRepository;

  Future<void> selectTruck(Truck truck) async {
    _selectedTruckRepository.setSelectedTruckId(truck.id);
  }
}
