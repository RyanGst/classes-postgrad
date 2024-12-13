
import 'dart:async';

import 'observable.dart';

class Subject<T> extends Observable<T> {
  Subject(T initialValue) {
    _value = initialValue;
  }

  @override
  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    notifyListeners();
  }

  late T _value;
}
