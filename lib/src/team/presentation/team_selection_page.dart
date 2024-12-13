import 'package:flutter/material.dart' hide Navigator;

import '../../core/di/Injector.dart';
import '../../core/presentation/components/base_page.dart';
import '../../core/presentation/state_consumer.dart';
import 'components/teams_failure.dart';
import 'components/teams_list.dart';
import 'components/teams_loading.dart';
import 'team_selection_view_model.dart';

class TeamSelectionPage extends StatefulWidget {
  const TeamSelectionPage({super.key});

  @override
  State<TeamSelectionPage> createState() => _TeamSelectionPageState();
}

class _TeamSelectionPageState extends State<TeamSelectionPage> {
  final viewModel = Injector.instance.get<TeamSelectionViewModel>();

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
      title: "Team Selection",
      body: SingleChildScrollView(
        child: StateConsumer(
          viewModel.state,
              (viewState) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (viewState.isLoadingTeams)
                const TeamsLoading()
              else if (viewState.shouldShowError)
                TeamsFailure(
                  errorMessage: viewModel.teamsErrorMessage,
                  retryClickListener: viewModel.loadTeams,
                )
              else
                TeamsList(
                  teams: viewState.teams,
                  isTeamSelected: viewModel.isTeamSelected,
                  onItemClick: viewModel.selectTeam,
                  onSubmitSelectionClick: viewModel.submitSelection,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
