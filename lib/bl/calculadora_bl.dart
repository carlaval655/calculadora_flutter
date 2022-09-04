import 'package:math_expressions/math_expressions.dart';
import 'package:calculadora_flutter/main.dart';
class CalculadoraBl{
  var input='';
  var respuesta = '0';
  String onKeyPress(int ind){
    var botonIgual = false;
    if (ind==0){
      input = '';
      respuesta = '0';
    } else if(ind==3){
      input=input.substring(0,input.length-1);
    } else if(ind == 18){
      botonIgual=true;
      igualPresionado();
    } else {
      input += botones[ind];
    }
    print ("OKP: $ind - $respuesta - $input");
    return botonIgual ? respuesta : input;
  }

  void igualPresionado(){
    String operacion = input;
    operacion = input.replaceAll('x', '*');

    double resultado = Parser().parse(operacion).evaluate(EvaluationType.REAL, ContextModel());

    respuesta = resultado.toString();
  }
}