import 'package:flutter/material.dart';

enum ButtonState { ready, loading, disabled }

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.title,
    required this.isEnabled,
    required this.isLoading,
    required this.onPressed,
  });

  final String title;
  final bool isEnabled;
  final bool isLoading;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final state = _calcState();
    return ElevatedButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
      ),
      child: _ButtonContent(state: state, title: title,),
    );
  }

  ButtonState _calcState() {
    if (isLoading) return ButtonState.loading;
    if (!isEnabled) return ButtonState.disabled;
    return ButtonState.ready;
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({ required this.state, required this.title });

  final ButtonState state;
  final String title;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ButtonState.ready:
        return Text(title);
      case ButtonState.disabled:
        return Text(title, style: const TextStyle(color: Colors.grey),);
      case ButtonState.loading:
        return const CircularProgressIndicator(
          color: Colors.white,
        );
    }
  }
}
