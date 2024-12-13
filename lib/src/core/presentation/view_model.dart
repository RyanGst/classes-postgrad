import 'package:flutter/foundation.dart';

import 'pub_sub/observable.dart';
import 'pub_sub/subject.dart';

abstract class ViewModel<T> with ChangeNotifier {
  Observable<T> get state => _subject;

  late final Subject<T> _subject;

  ViewModel() {
    _subject = Subject(build());
  }

  T build();

  void onViewInitialized() {}

  @protected
  void updateState(T Function(T) updater) {
    _subject.value = updater(_subject.value);
  }
}
