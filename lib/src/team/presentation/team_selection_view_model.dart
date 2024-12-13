import 'package:injectable/injectable.dart';

import '../../core/presentation/navigation/destination.dart';
import '../../core/presentation/navigation/navigator.dart';
import '../../core/presentation/view_model.dart';
import '../domain/entities/team.dart';
import '../domain/get_selected_team_use_case.dart';
import '../domain/get_teams_use_case.dart';
import '../domain/select_team_use_case.dart';
import 'team_selection_view_state.dart';

@singleton
class TeamSelectionViewModel extends ViewModel<TeamSelectionViewState> {
  final GetTeamsUseCase _getTeamsUseCase;
  final SelectTeamUseCase _selectTeamUseCase;
  final GetSelectedTeamUseCase _getSelectedTeamUseCase;
  final Navigator _navigator;

  TeamSelectionViewModel({
    required GetTeamsUseCase getTeamsUseCase,
    required SelectTeamUseCase selectTeamUseCase,
    required GetSelectedTeamUseCase getSelectedTeamUseCase,
    required Navigator navigator,
  })  : _getTeamsUseCase = getTeamsUseCase,
        _selectTeamUseCase = selectTeamUseCase,
        _getSelectedTeamUseCase = getSelectedTeamUseCase,
        _navigator = navigator;

  String? _fetchTeamsErrorMessage;

  String get teamsErrorMessage =>
      _fetchTeamsErrorMessage ?? "Failed to fetch teams";

  @override
  TeamSelectionViewState build() => TeamSelectionViewState.initial();

  @override
  void onViewInitialized() {
    loadTeams();
  }

  void loadTeams() async {
    _fetchTeamsErrorMessage = null;
    updateState((state) => state.updateTeamsLoadingState(isLoading: true));
    try {
      final teams = await _getTeamsUseCase.getAvailableTeams();
      final selectedTeam = await _getSelectedTeamUseCase.getSelectedTeam();
      updateState((state) =>
          state.updateTeams(teams).updateTeamSelection(selectedTeam));
    } catch (e) {
      _fetchTeamsErrorMessage = "Failed to fetch teams";
      updateState((state) => state.updateErrorState(shouldShowError: true));
    } finally {
      updateState((state) => state.updateTeamsLoadingState(isLoading: false));
    }
  }

  void selectTeam(Team team) async {
    final selectedTeam = state.value.selectedTeam;
    if (selectedTeam != team) {
      updateState((state) => state
          .updateSubmitButtonEnabledState(team != selectedTeam)
          .updateTeamSelection(team));
    }
  }

  void submitSelection() async {
    final selectedTeam = state.value.selectedTeam;
    if (selectedTeam != null) {
      updateState((state) => state.updateSubmitButtonLoadingState(true));
      await _selectTeamUseCase.selectTeam(selectedTeam);
      _navigator.push(Destination.truckSelection);
    }
  }

  bool isTeamSelected(Team team) => team == state.value.selectedTeam;
}
