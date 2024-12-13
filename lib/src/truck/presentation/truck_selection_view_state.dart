import 'package:equatable/equatable.dart';

import '../domain/entities/truck.dart';

class TruckSelectionViewState extends Equatable {
  final List<Truck> trucks;
  final bool isLoadingTrucks;
  final bool isSubmitButtonEnabled;
  final bool shouldShowSubmitButtonLoading;
  final bool shouldShowError;
  final Truck? selectedTruck;

  const TruckSelectionViewState({
    required this.trucks,
    required this.isLoadingTrucks,
    required this.isSubmitButtonEnabled,
    required this.shouldShowSubmitButtonLoading,
    required this.shouldShowError,
    required this.selectedTruck,
  });

  TruckSelectionViewState.initial()
      : trucks = [],
        isLoadingTrucks = false,
        isSubmitButtonEnabled = false,
        shouldShowSubmitButtonLoading = false,
        shouldShowError = false,
        selectedTruck = null;

  TruckSelectionViewState updateTrucks(List<Truck> trucksUpdate) {
    return TruckSelectionViewState(
      trucks: trucksUpdate,
      isLoadingTrucks: isLoadingTrucks,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTruck: selectedTruck,
    );
  }

  TruckSelectionViewState updateTrucksLoadingState({required bool isLoading}) {
    return TruckSelectionViewState(
      trucks: trucks,
      isLoadingTrucks: isLoading,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTruck: selectedTruck,
    );
  }

  TruckSelectionViewState updateSubmitButtonEnabledState(bool isEnabled) {
    return TruckSelectionViewState(
      trucks: trucks,
      isLoadingTrucks: isLoadingTrucks,
      isSubmitButtonEnabled: isEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTruck: selectedTruck,
    );
  }

  TruckSelectionViewState updateSubmitButtonLoadingState(bool isLoading) {
    return TruckSelectionViewState(
      trucks: trucks,
      isLoadingTrucks: isLoadingTrucks,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: isLoading,
      shouldShowError: shouldShowError,
      selectedTruck: selectedTruck,
    );
  }

  TruckSelectionViewState updateErrorState({required bool shouldShowError}) {
    return TruckSelectionViewState(
      trucks: trucks,
      isLoadingTrucks: isLoadingTrucks,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTruck: selectedTruck,
    );
  }

  TruckSelectionViewState updateTruckSelection(Truck? truck) {
    return TruckSelectionViewState(
      trucks: trucks,
      isLoadingTrucks: isLoadingTrucks,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTruck: truck,
    );
  }

  @override
  List<Object?> get props => [
        trucks,
        isSubmitButtonEnabled,
        shouldShowSubmitButtonLoading,
        shouldShowError,
        selectedTruck,
      ];
}
