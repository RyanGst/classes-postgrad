import 'package:injectable/injectable.dart';

import '../../core/presentation/navigation/destination.dart';
import '../../core/presentation/navigation/navigator.dart';
import '../../core/presentation/view_model.dart';
import '../domain/entities/truck.dart';
import '../domain/get_selected_truck_use_case.dart';
import '../domain/get_trucks_use_case.dart';
import '../domain/select_truck_use_case.dart';
import 'truck_selection_view_state.dart';

@singleton
class TruckSelectionViewModel extends ViewModel<TruckSelectionViewState> {
  final GetTrucksUseCase _getTrucksUseCase;
  final SelectTruckUseCase _selectTruckUseCase;
  final GetSelectedTruckUseCase _getSelectedTruckUseCase;
  final Navigator _navigator;

  @factoryMethod
  TruckSelectionViewModel({
    required GetTrucksUseCase getTrucksUseCase,
    required SelectTruckUseCase selectTruckUseCase,
    required GetSelectedTruckUseCase getSelectedTruckUseCase,
    required Navigator navigator,
  })  : _getTrucksUseCase = getTrucksUseCase,
        _selectTruckUseCase = selectTruckUseCase,
        _getSelectedTruckUseCase = getSelectedTruckUseCase,
        _navigator = navigator;

  String? _fetchTrucksErrorMessage;

  String get trucksErrorMessage =>
      _fetchTrucksErrorMessage ?? "Failed to fetch trucks";

  @override
  TruckSelectionViewState build() => TruckSelectionViewState.initial();

  @override
  void onViewInitialized() {
    loadTrucks();
  }

  void loadTrucks() async {
    _fetchTrucksErrorMessage = null;
    updateState((state) => state.updateTrucksLoadingState(isLoading: true));
    try {
      final trucks = await _getTrucksUseCase.getTrucks();
      final selectedTruck = await _getSelectedTruckUseCase.getSelectedTruck();
      updateState((state) =>
          state.updateTrucks(trucks).updateTruckSelection(selectedTruck));
    } catch (e) {
      _fetchTrucksErrorMessage = "Failed to fetch trucks";
      updateState((state) => state.updateErrorState(shouldShowError: true));
    } finally {
      updateState((state) => state.updateTrucksLoadingState(isLoading: false));
    }
  }

  void selectTruck(Truck truck) async {
    final selectedTruck = state.value.selectedTruck;
    updateState((state) => state
        .updateSubmitButtonEnabledState(truck != selectedTruck)
        .updateTruckSelection(truck));
  }

  void submitSelection() async {
    final selectedTruck = state.value.selectedTruck;
    if (selectedTruck != null) {
      updateState((state) => state.updateSubmitButtonLoadingState(true));
      await _selectTruckUseCase.selectTruck(selectedTruck);
      _navigator.push(Destination.truckSelection);
    }
  }

  bool isTruckSelected(Truck truck) => truck == state.value.selectedTruck;
}
