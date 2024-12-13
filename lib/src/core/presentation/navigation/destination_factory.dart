import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../login/presentation/login_page.dart';
import '../../../team/presentation/team_selection_page.dart';
import '../../../truck/presentation/truck_selection_page.dart';
import 'destination.dart';

@singleton
class DestinationFactory {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final destination = Destination.parse(settings.name);
    return MaterialPageRoute(builder: (_) => _createPage(destination));
  }

  Widget _createPage(Destination destination) {
    switch (destination) {
      case Destination.login:
        return const LoginPage();
      case Destination.teamSelection:
        return const TeamSelectionPage();
      case Destination.truckSelection:
        return const TruckSelectionPage();
      default:
        return const LoginPage();
    }
  }
}
