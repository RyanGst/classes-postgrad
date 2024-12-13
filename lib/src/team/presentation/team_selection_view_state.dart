import 'package:equatable/equatable.dart';

import '../domain/entities/team.dart';

class TeamSelectionViewState extends Equatable {
  final List<Team> teams;
  final bool isLoadingTeams;
  final bool isSubmitButtonEnabled;
  final bool shouldShowSubmitButtonLoading;
  final bool shouldShowError;
  final Team? selectedTeam;

  const TeamSelectionViewState({
    required this.teams,
    required this.isLoadingTeams,
    required this.isSubmitButtonEnabled,
    required this.shouldShowSubmitButtonLoading,
    required this.shouldShowError,
    required this.selectedTeam,
  });

  TeamSelectionViewState.initial()
      : teams = [],
        isLoadingTeams = false,
        isSubmitButtonEnabled = false,
        shouldShowSubmitButtonLoading = false,
        shouldShowError = false,
        selectedTeam = null;

  TeamSelectionViewState updateTeams(List<Team> teamsUpdate) {
    return TeamSelectionViewState(
      teams: teamsUpdate,
      isLoadingTeams: isLoadingTeams,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTeam: selectedTeam,
    );
  }

  TeamSelectionViewState updateTeamsLoadingState({required bool isLoading}) {
    return TeamSelectionViewState(
      teams: teams,
      isLoadingTeams: isLoading,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTeam: selectedTeam,
    );
  }

  TeamSelectionViewState updateSubmitButtonEnabledState(bool isEnabled) {
    return TeamSelectionViewState(
      teams: teams,
      isLoadingTeams: isLoadingTeams,
      isSubmitButtonEnabled: isEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTeam: selectedTeam,
    );
  }

  TeamSelectionViewState updateSubmitButtonLoadingState(bool isLoading) {
    return TeamSelectionViewState(
      teams: teams,
      isLoadingTeams: isLoadingTeams,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: isLoading,
      shouldShowError: shouldShowError,
      selectedTeam: selectedTeam,
    );
  }

  TeamSelectionViewState updateErrorState({required bool shouldShowError}) {
    return TeamSelectionViewState(
      teams: teams,
      isLoadingTeams: isLoadingTeams,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTeam: selectedTeam,
    );
  }

  TeamSelectionViewState updateTeamSelection(Team? team) {
    return TeamSelectionViewState(
      teams: teams,
      isLoadingTeams: isLoadingTeams,
      isSubmitButtonEnabled: isSubmitButtonEnabled,
      shouldShowSubmitButtonLoading: shouldShowSubmitButtonLoading,
      shouldShowError: shouldShowError,
      selectedTeam: team,
    );
  }

  @override
  List<Object?> get props => [
        teams,
        isSubmitButtonEnabled,
        shouldShowSubmitButtonLoading,
        shouldShowError,
      ];
}
