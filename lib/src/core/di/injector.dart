
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';

class Injector {
  static final Injector instance = Injector._();

  Injector._();

  final _getIt = GetIt.instance;

  void init() {
    _configureDependencies(_getIt);
  }

  T get<T extends Object>() {
    return _getIt.get();
  }
}

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void _configureDependencies(GetIt getIt) => getIt.init();
