import 'package:flutter/material.dart' hide Navigator;

import 'src/core/di/Injector.dart';
import 'src/core/presentation/navigation/destination_factory.dart';
import 'src/login/presentation/login_page.dart';

void main() {
  Injector.instance.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
      navigatorKey: Injector.instance.get(),
      onGenerateRoute:
          Injector.instance.get<DestinationFactory>().generateRoute,
    );
  }
}
