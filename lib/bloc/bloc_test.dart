import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/provider/bloc_provider.dart';

class MyBloc extends BlocBase{
  int _counter;
  StreamController<int> streamListController = StreamController<int>.broadcast();
  @override
  void dispose() {
    streamListController.close();
    actionController.close();
  }
  Sink<int> get AddTest => streamListController.sink;
  Stream<int> get GetTest => streamListController.stream;
  StreamController actionController = StreamController();
  Sink get IncretmentConter => actionController.sink;
  MyBloc(){
    _counter = 0;
    actionController.stream.listen(_handleLogic);
  }
  void _handleLogic(data){
    _counter = _counter+2;
    print(_counter);
    print(_counter+1);
    AddTest.add(_counter);
  }

}