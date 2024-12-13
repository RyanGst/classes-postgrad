import 'package:flutter/material.dart';

class TrucksLoading extends StatelessWidget {
  const TrucksLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          strokeWidth: 8.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }
}
