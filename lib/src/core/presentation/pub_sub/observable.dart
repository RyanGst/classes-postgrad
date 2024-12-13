
import 'package:flutter/cupertino.dart';

abstract class Observable<T> with ChangeNotifier {
  T get value;
}
