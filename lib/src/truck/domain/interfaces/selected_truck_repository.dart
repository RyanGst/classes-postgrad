
abstract class SelectedTruckRepository {
  Future<void> setSelectedTruckId(String id);
  Future<String?> getSelectedTruckId();
  Future<void> clear();
}
