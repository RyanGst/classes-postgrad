import 'package:injectable/injectable.dart';

@singleton
class SelectedTruckStorage {
  String? _selectedTruckId;

  Future<void> clear() async {
    _selectedTruckId = null;
  }

  Future<void> saveSelectedTruckId(String id) async {
    _selectedTruckId = id;
  }

  Future<String?> getSelectedTruckId() async {
    return _selectedTruckId;
  }
}
