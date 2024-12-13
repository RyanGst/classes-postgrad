import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import 'destination.dart';

@singleton
class Navigator {
  final GlobalKey<NavigatorState> _navigatorKey;

  @factoryMethod
  Navigator(GlobalKey<NavigatorState> navigatorKey)
      : _navigatorKey = navigatorKey;

  void push(Destination destination) {
    _navigatorKey.currentState?.pushNamed(destination.path);
  }

  void pushReplacement(Destination destination) {
    _navigatorKey.currentState?.pushReplacementNamed(destination.path);
  }

  void back() {
    _navigatorKey.currentState?.pop();
  }
}
