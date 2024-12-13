import 'package:flutter/material.dart';
import '../../domain/entities/team.dart';

class TeamsList extends StatelessWidget {
  final List<Team> teams;
  final bool Function(Team) isTeamSelected;
  final void Function(Team) onItemClick;
  final void Function() onSubmitSelectionClick;

  const TeamsList({
    super.key,
    required this.teams,
    required this.isTeamSelected,
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
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];
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
                        if (isTeamSelected(team)) const Icon(Icons.check),
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
