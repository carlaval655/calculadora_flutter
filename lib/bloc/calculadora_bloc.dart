import 'dart:async';

import 'package:calculadora_flutter/bl/calculadora_bl.dart';

import 'bloc.dart';

class CalculadoraBloc implements Bloc{
  final _calculadoraBl = CalculadoraBl();

  final _calculadoraController = StreamController<int>();

  Sink<int?> get pressKeySink => _calculadoraController.sink;

  late Stream<String?> calculadoraStream;

  CalculadoraBloc(){
    calculadoraStream = _calculadoraController.stream.asyncMap((key){
      return _calculadoraBl.onKeyPress(key);
    });
  }

  @override
  void dispose(){
    _calculadoraController.close();
  }
}