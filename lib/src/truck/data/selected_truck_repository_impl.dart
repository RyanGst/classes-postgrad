
import 'package:injectable/injectable.dart';

import '../domain/interfaces/selected_truck_repository.dart';
import 'selected_truck_storage.dart';

@Singleton(as: SelectedTruckRepository)
class SelectedTruckRepositoryImpl implements SelectedTruckRepository {
  final SelectedTruckStorage _selectedTruckStorage;

  SelectedTruckRepositoryImpl({ required SelectedTruckStorage selectedTruckStorage, }):
        _selectedTruckStorage = selectedTruckStorage;

  @override
  Future<void> clear() async {
    await _selectedTruckStorage.clear();
  }

  @override
  Future<String?> getSelectedTruckId() {
    return _selectedTruckStorage.getSelectedTruckId();
  }

  @override
  Future<void> setSelectedTruckId(String id) async {
    await _selectedTruckStorage.saveSelectedTruckId(id);
  }
}
