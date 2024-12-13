
import '../util/try_cast.dart';

sealed class Resource<T> {
  T? get data => null;

  K? as<K extends Resource<T>>() {
    return tryCast<K>(this);
  }

  Failure<T>? asFailure() {
    return as<Failure<T>>();
  }

  Success<T>? asSuccess() {
    return as<Success<T>>();
  }
}

class Success<T> extends Resource<T> {
  Success(this.data);

  @override
  final T data;
}

class Loading<T> extends Resource<T> {}

class Failure<T> extends Resource<T> {
  Failure(this.message);

  final String message;
}

class Uninitialized<T> extends Resource<T> {}
