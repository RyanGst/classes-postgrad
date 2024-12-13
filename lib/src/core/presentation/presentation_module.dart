import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PresentationModule {
  @singleton
  GlobalKey<NavigatorState> getNavigatorKey() => GlobalKey<NavigatorState>();
}
