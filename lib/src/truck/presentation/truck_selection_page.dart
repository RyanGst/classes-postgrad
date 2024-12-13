import 'package:flutter/material.dart' hide Navigator;

import '../../core/di/Injector.dart';
import '../../core/presentation/components/base_page.dart';
import '../../core/presentation/state_consumer.dart';
import 'components/trucks_failure.dart';
import 'components/trucks_list.dart';
import 'components/trucks_loading.dart';
import 'truck_selection_view_model.dart';

class TruckSelectionPage extends StatefulWidget {
  const TruckSelectionPage({super.key});

  @override
  State<TruckSelectionPage> createState() => _TruckSelectionPageState();
}

class _TruckSelectionPageState extends State<TruckSelectionPage> {
  final viewModel = Injector.instance.get<TruckSelectionViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.onViewInitialized();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Truck Selection",
      body: Expanded(child: SingleChildScrollView(
        child: StateConsumer(
          viewModel.state,
              (viewState) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (viewState.isLoadingTrucks)
                const TrucksLoading()
              else if (viewState.shouldShowError)
                TrucksFailure(
                  errorMessage: viewModel.trucksErrorMessage,
                  retryClickListener: viewModel.loadTrucks,
                )
              else
                TrucksList(
                  trucks: viewState.trucks,
                  isTruckSelected: viewModel.isTruckSelected,
                  onItemClick: viewModel.selectTruck,
                  onSubmitSelectionClick: viewModel.submitSelection,
                ),
            ],
          ),
        ),
      ),),
    );
  }
}
