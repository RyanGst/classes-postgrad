import 'package:injectable/injectable.dart';

import '../../core/presentation/navigation/destination.dart';
import '../../core/presentation/navigation/navigator.dart';
import '../../core/presentation/view_model.dart';
import '../../user/domain/check_stored_user_use_case.dart';
import '../domain/auth_exception.dart';
import '../domain/login_use_case.dart';
import 'login_view_state.dart';

@singleton
class LoginViewModel extends ViewModel<LoginViewState> {
  final LoginUseCase _loginUseCase;
  final Navigator _navigator;
  final CheckStoredUserUseCase _checkStoredUserUseCase;

  LoginViewModel({
    required LoginUseCase loginUseCase,
    required Navigator navigator,
    required CheckStoredUserUseCase checkStoredUserUseCase,
  })  : _loginUseCase = loginUseCase,
        _navigator = navigator,
        _checkStoredUserUseCase = checkStoredUserUseCase;

  String? _login;
  String? _password;

  @override
  LoginViewState build() => LoginViewState.initial();

  @override
  void onViewInitialized() {
    _checkStoredUser();
  }

  Future<void> _checkStoredUser() async {
    try {
      final storedUser = await _checkStoredUserUseCase.checkStoredUser();
      if (storedUser != null) {
        _navigator.pushReplacement(Destination.teamSelection);
      }
    } catch (e) {
      // If there's an error checking stored user, we just continue with normal login flow
    }
  }

  Future<void> onLoginClick() async {
    try {
      updateState((state) => state.updateLoading(isLoading: true));
      final submittedLogin = _login;
      final submittedPassword = _password;

      if (submittedLogin != null && submittedPassword != null) {
        await _loginUseCase.login(
            login: submittedLogin, password: submittedPassword);
        _navigator.pushReplacement(Destination.teamSelection);
      }
    } on AuthException catch (e) {
      updateState((state) => state.updateAuthErrorMessage(message: e.message));
    } catch (e) {
      updateState((state) => state.updateAuthErrorMessage(message: "Oops"));
    } finally {
      updateState((state) => state.updateLoading(isLoading: false));
    }
  }

  void onLoginUpdate(String login) {
    _login = login;
    _handleCredentialsInput();
  }

  void onPasswordUpdate(String password) {
    _password = password;
    _handleCredentialsInput();
  }

  void _handleCredentialsInput() {
    final canSubmitCredentials =
        _login?.isNotEmpty == true && _password?.isNotEmpty == true;

    updateState((state) => state
        .updateLoginButtonState(isButtonEnabled: canSubmitCredentials)
        .updateAuthErrorMessage(message: null));
  }
}
