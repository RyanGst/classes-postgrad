import 'package:flutter/material.dart';
import '../../domain/entities/truck.dart';

class TrucksList extends StatelessWidget {
  final List<Truck> trucks;
  final bool Function(Truck) isTruckSelected;
  final void Function(Truck) onItemClick;
  final void Function() onSubmitSelectionClick;

  const TrucksList({
    super.key,
    required this.trucks,
    required this.isTruckSelected,
    required this.onItemClick,
    required this.onSubmitSelectionClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: trucks.length,
              itemBuilder: (context, index) {
                final team = trucks[index];
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => onItemClick(team),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(team.name),
                        if (isTruckSelected(team)) const Icon(Icons.check),
                      ],
                    ),
                  ),
                );
              },
            ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubmitSelectionClick,
                child: const Text("Select"),
              ),
            ),
          ),
        ],
      );
  }
}
