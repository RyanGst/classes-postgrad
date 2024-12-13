import 'package:flutter/material.dart';

class TeamsFailure extends StatelessWidget {
  final String errorMessage;
  final void Function() retryClickListener;

  const TeamsFailure({
    super.key,
    required this.errorMessage,
    required this.retryClickListener,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.all(24),
          child: Text(errorMessage),
        ),
        ElevatedButton(
          onPressed: retryClickListener,
          child: const Text("Retry"),
        ),
      ],
    );
  }
}
