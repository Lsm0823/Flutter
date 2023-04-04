// counter_controller.dart
import 'dart:async';

class CounterController{
  final _counterStreamController = StreamController<int>();
  // .stream : 데이터가 나오는 곳.
  Stream<int> get counterStream => _counterStreamController.stream;

  void addCount(int newCount){
    _counterStreamController.sink.add(newCount);

  }
}