import 'package:flutter/material.dart';

import '../../core/di/Injector.dart';
import '../../core/presentation/components/action_button.dart';
import '../../core/presentation/components/base_page.dart';
import '../../core/presentation/state_consumer.dart';
import 'login_view_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel viewModel = Injector.instance.get();

    return BasePage(
      title: "Login",
      body: Center(
        child: StateConsumer(
          viewModel.state,
          (viewState) => Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: viewState.savedUsername,
                  onChanged: viewModel.onLoginUpdate,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: viewModel.onPasswordUpdate,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                if (viewState.authErrorMessage != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    viewState.authErrorMessage!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ActionButton(
                    title: "Login",
                    isLoading: viewState.isLoading,
                    isEnabled: viewState.isLoginButtonEnabled,
                    onPressed: viewModel.onLoginClick,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
