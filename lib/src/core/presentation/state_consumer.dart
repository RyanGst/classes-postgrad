import 'package:flutter/widgets.dart';

import 'pub_sub/observable.dart';

class StateConsumer<T> extends StatelessWidget {
  const StateConsumer(
    this.observable,
    this.childBuilder, {
    super.key,
  });

  final Observable<T> observable;
  final Widget Function(T) childBuilder;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: observable,
      builder: (buildContext, child) => childBuilder(observable.value),
    );
  }
}
