import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LiveData<T> with ChangeNotifier {
  T _data;

  T get value => _data;

  set value(T data) {
    _data = data;
    notifyListeners();
  }
}

class LiveDataWidget<T extends LiveData> extends StatelessWidget {
  LiveDataWidget(
      {Key key, @required this.liveData, @required this.builder, this.child})
      : assert(liveData != null),
        assert(builder != null),
        super(key: key);

  final T liveData;

  final Widget Function(BuildContext context, T value, Widget child) builder;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) {
        return liveData;
      },
      child: Consumer(
        builder: builder,
        child: child,
      ),
    );
  }
}
