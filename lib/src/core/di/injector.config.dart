// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/widgets.dart' as _i718;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../login/data/login_api.dart' as _i219;
import '../../login/data/login_repository_impl.dart' as _i142;
import '../../login/data/login_service_impl.dart' as _i527;
import '../../login/domain/interfaces/login_repository.dart' as _i586;
import '../../login/domain/interfaces/login_service.dart' as _i856;
import '../../login/domain/login_use_case.dart' as _i200;
import '../../login/presentation/login_view_model.dart' as _i297;
import '../../team/data/team_api.dart' as _i994;
import '../../team/data/teams_repository_impl.dart' as _i125;
import '../../team/data/teams_service.dart' as _i790;
import '../../team/data/teams_storage.dart' as _i446;
import '../../team/domain/get_selected_team_use_case.dart' as _i501;
import '../../team/domain/get_teams_use_case.dart' as _i863;
import '../../team/domain/interfaces/teams_repository.dart' as _i46;
import '../../team/domain/select_team_use_case.dart' as _i430;
import '../../team/presentation/team_selection_view_model.dart' as _i299;
import '../../truck/data/selected_truck_repository_impl.dart' as _i36;
import '../../truck/data/selected_truck_storage.dart' as _i907;
import '../../truck/domain/get_selected_truck_use_case.dart' as _i146;
import '../../truck/domain/get_trucks_use_case.dart' as _i725;
import '../../truck/domain/interfaces/selected_truck_repository.dart' as _i495;
import '../../truck/domain/select_truck_use_case.dart' as _i377;
import '../../truck/presentation/truck_selection_view_model.dart' as _i294;
import '../../user/data/user_api.dart' as _i1057;
import '../../user/data/user_repository_impl.dart' as _i487;
import '../../user/data/user_storage.dart' as _i4;
import '../../user/domain/check_stored_user_use_case.dart' as _i524;
import '../../user/domain/interfaces/user_repository.dart' as _i283;
import '../config/config.dart' as _i406;
import '../data/data_module.dart' as _i319;
import '../presentation/navigation/destination_factory.dart' as _i732;
import '../presentation/navigation/navigator.dart' as _i703;
import '../presentation/presentation_module.dart' as _i469;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final presentationModule = _$PresentationModule();
    final dataModule = _$DataModule();
    gh.singleton<_i406.Config>(() => _i406.Config());
    gh.singleton<_i718.GlobalKey<_i718.NavigatorState>>(
        () => presentationModule.getNavigatorKey());
    gh.singleton<_i732.DestinationFactory>(() => _i732.DestinationFactory());
    gh.singletonAsync<_i4.UserStorage>(() => _i4.UserStorage.create());
    gh.singleton<_i907.SelectedTruckStorage>(
        () => _i907.SelectedTruckStorage());
    gh.singleton<_i446.TeamsStorage>(() => _i446.TeamsStorage());
    gh.singleton<_i586.LoginRepository>(() => _i142.LoginRepositoryImpl());
    gh.factory<_i361.Dio>(() => dataModule.getDio(gh<_i406.Config>()));
    gh.singleton<_i495.SelectedTruckRepository>(() =>
        _i36.SelectedTruckRepositoryImpl(
            selectedTruckStorage: gh<_i907.SelectedTruckStorage>()));
    gh.singleton<_i703.Navigator>(
        () => _i703.Navigator(gh<_i718.GlobalKey<_i718.NavigatorState>>()));
    gh.singleton<_i377.SelectTruckUseCase>(() => _i377.SelectTruckUseCase(
        selectedTruckRepository: gh<_i495.SelectedTruckRepository>()));
    gh.singleton<_i1057.UserApi>(() => _i1057.UserApi(gh<_i361.Dio>()));
    gh.singleton<_i994.TeamApi>(() => _i994.TeamApi(gh<_i361.Dio>()));
    gh.singleton<_i219.LoginApi>(() => _i219.LoginApi(gh<_i361.Dio>()));
    gh.singleton<_i856.LoginService>(
        () => _i527.LoginServiceImpl(api: gh<_i219.LoginApi>()));
    gh.singleton<_i790.TeamsService>(
        () => _i790.TeamsService(api: gh<_i994.TeamApi>()));
    gh.singleton<_i46.TeamsRepository>(() => _i125.TeamsRepositoryImpl(
          teamsService: gh<_i790.TeamsService>(),
          teamsStorage: gh<_i446.TeamsStorage>(),
        ));
    gh.singletonAsync<_i283.UserRepository>(
        () async => _i487.UserRepositoryImpl(
              userApi: gh<_i1057.UserApi>(),
              userStorage: await getAsync<_i4.UserStorage>(),
            ));
    gh.singleton<_i501.GetSelectedTeamUseCase>(() =>
        _i501.GetSelectedTeamUseCase(
            teamsRepository: gh<_i46.TeamsRepository>()));
    gh.singleton<_i430.SelectTeamUseCase>(() =>
        _i430.SelectTeamUseCase(teamsRepository: gh<_i46.TeamsRepository>()));
    gh.singletonAsync<_i863.GetTeamsUseCase>(() async => _i863.GetTeamsUseCase(
        userRepository: await getAsync<_i283.UserRepository>()));
    gh.singletonAsync<_i524.CheckStoredUserUseCase>(() async =>
        _i524.CheckStoredUserUseCase(
            userRepository: await getAsync<_i283.UserRepository>()));
    gh.factory<_i200.LoginUseCase>(() => _i200.LoginUseCase(
          loginService: gh<_i856.LoginService>(),
          loginRepository: gh<_i586.LoginRepository>(),
        ));
    gh.singleton<_i725.GetTrucksUseCase>(() => _i725.GetTrucksUseCase(
        getSelectedTeamUseCase: gh<_i501.GetSelectedTeamUseCase>()));
    gh.singleton<_i146.GetSelectedTruckUseCase>(
        () => _i146.GetSelectedTruckUseCase(
              getSelectedTeamUseCase: gh<_i501.GetSelectedTeamUseCase>(),
              selectedTruckRepository: gh<_i495.SelectedTruckRepository>(),
            ));
    gh.singleton<_i294.TruckSelectionViewModel>(
        () => _i294.TruckSelectionViewModel(
              getTrucksUseCase: gh<_i725.GetTrucksUseCase>(),
              selectTruckUseCase: gh<_i377.SelectTruckUseCase>(),
              getSelectedTruckUseCase: gh<_i146.GetSelectedTruckUseCase>(),
              navigator: gh<_i703.Navigator>(),
            ));
    gh.singletonAsync<_i299.TeamSelectionViewModel>(
        () async => _i299.TeamSelectionViewModel(
              getTeamsUseCase: await getAsync<_i863.GetTeamsUseCase>(),
              selectTeamUseCase: gh<_i430.SelectTeamUseCase>(),
              getSelectedTeamUseCase: gh<_i501.GetSelectedTeamUseCase>(),
              navigator: gh<_i703.Navigator>(),
            ));
    gh.singletonAsync<_i297.LoginViewModel>(() async => _i297.LoginViewModel(
          loginUseCase: gh<_i200.LoginUseCase>(),
          navigator: gh<_i703.Navigator>(),
          checkStoredUserUseCase:
              await getAsync<_i524.CheckStoredUserUseCase>(),
        ));
    return this;
  }
}

class _$PresentationModule extends _i469.PresentationModule {}

class _$DataModule extends _i319.DataModule {}
