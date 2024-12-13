
import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key, required String title, required Widget body}): _title = title, _body = body;

  final String _title;
  final Widget _body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_title),
      ),
      body: _body,
    );
  }
}
