class LoginViewState {
  LoginViewState({
    required this.isLoading,
    required this.isLoginButtonEnabled,
    this.savedUsername,
    required this.shouldRememberUsername,
    this.authErrorMessage,
  });

  LoginViewState.initial()
      : isLoading = false,
        isLoginButtonEnabled = false,
        savedUsername = null,
        shouldRememberUsername = false,
        authErrorMessage = null;

  final bool isLoading;
  final bool isLoginButtonEnabled;
  final String? savedUsername;
  final bool shouldRememberUsername;
  final String? authErrorMessage;

  LoginViewState updateLoading({required bool isLoading}) {
    return LoginViewState(
      isLoading: isLoading,
      isLoginButtonEnabled: isLoginButtonEnabled,
      savedUsername: savedUsername,
      shouldRememberUsername: shouldRememberUsername,
      authErrorMessage: authErrorMessage,
    );
  }

  LoginViewState updateLoginButtonState({required bool isButtonEnabled}) {
    return LoginViewState(
      isLoading: isLoading,
      isLoginButtonEnabled: isButtonEnabled,
      savedUsername: savedUsername,
      shouldRememberUsername: shouldRememberUsername,
      authErrorMessage: authErrorMessage,
    );
  }

  LoginViewState updateAuthErrorMessage({String? message}) {
    return LoginViewState(
      isLoading: isLoading,
      isLoginButtonEnabled: isLoginButtonEnabled,
      savedUsername: savedUsername,
      shouldRememberUsername: shouldRememberUsername,
      authErrorMessage: message,
    );
  }
}
