import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpodexample/src/core/presentation/navigation/destination.dart';
import 'package:riverpodexample/src/core/presentation/navigation/navigator.dart';
import 'package:riverpodexample/src/login/domain/auth_exception.dart';
import 'package:riverpodexample/src/login/domain/login_use_case.dart';
import 'package:riverpodexample/src/login/presentation/login_view_model.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockNavigator extends Mock implements Navigator {}

void main() {
  late LoginViewModel sut;
  late MockLoginUseCase mockLoginUseCase;
  late MockNavigator mockNavigator;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockNavigator = MockNavigator();
    sut = LoginViewModel(
      loginUseCase: mockLoginUseCase,
      navigator: mockNavigator,
    );
  });

  group('LoginViewModel', () {
    test('initial state has login button disabled', () {
      expect(sut.state.value.isLoginButtonEnabled, false);
      expect(sut.state.value.isLoading, false);
      expect(sut.state.value.authErrorMessage, null);
    });

    test('login button becomes enabled when both fields are filled', () {
      sut.onLoginUpdate('user');
      expect(sut.state.value.isLoginButtonEnabled, false);

      sut.onPasswordUpdate('pass');
      expect(sut.state.value.isLoginButtonEnabled, true);
    });

    test('login button becomes disabled when fields are cleared', () {
      sut.onLoginUpdate('user');
      sut.onPasswordUpdate('pass');
      expect(sut.state.value.isLoginButtonEnabled, true);

      sut.onLoginUpdate('');
      expect(sut.state.value.isLoginButtonEnabled, false);
    });

    group('onLoginClick', () {
      test('successful login navigates to team selection', () async {
        // Arrange
        when(mockLoginUseCase.login(
          login: 'user',
          password: 'pass',
        )).thenAnswer((_) async {});

        sut.onLoginUpdate('user');
        sut.onPasswordUpdate('pass');

        // Act
        await sut.onLoginClick();

        // Assert
        verify(mockLoginUseCase.login(login: 'user', password: 'pass'))
            .called(1);
        verify(mockNavigator.push(Destination.teamSelection)).called(1);
        expect(sut.state.value.isLoading, false);
        expect(sut.state.value.authErrorMessage, null);
      });

      test('shows error message on auth failure', () async {
        // Arrange
        var login = 'user';
        var password = 'pass';
        when(mockLoginUseCase.login(
          login: login,
          password: password,
        )).thenThrow(AuthException('Invalid credentials'));

        sut.onLoginUpdate(login);
        sut.onPasswordUpdate(password);

        // Act
        await sut.onLoginClick();

        // Assert
        verify(mockLoginUseCase.login(login: login, password: password))
            .called(1);
        expect(sut.state.value.authErrorMessage, 'Invalid credentials');
        expect(sut.state.value.isLoading, false);
      });

      test('shows generic error message on unexpected error', () async {
        // Arrange
        var login = 'user';
        var password = 'pass';
        when(mockLoginUseCase.login(
          login: login,
          password: password,
        )).thenThrow(Exception('Unexpected error'));

        sut.onLoginUpdate(login);
        sut.onPasswordUpdate(password);

        // Act
        await sut.onLoginClick();

        // Assert
        verify(mockLoginUseCase.login(login: 'user', password: 'pass'))
            .called(1);
        expect(sut.state.value.authErrorMessage, 'Oops');
        expect(sut.state.value.isLoading, false);
      });
    });
  });
}
