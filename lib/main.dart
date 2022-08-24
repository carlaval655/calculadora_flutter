// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "";

  String _output = ""; //Output temporal para cambiar de estado output
  double num1=0.0;
  double num2=0.0;
  String operacion="";

  buttonPressed(String buttonText){
    if (buttonText=="Clear"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operacion="";
    } else if(buttonText=="+" || buttonText=="-" || buttonText=="X" || buttonText=="/"){//Significa que el usuario ya ingreso un numero e ingresara el siguiente
      num1=double.parse(output);

      operacion=buttonText;

      _output = "0";
    } else if (buttonText=="."){
      if(_output.contains(".")){
        print("El numero ya tiene decimales");
        return;
      } else{
        _output=_output+buttonText;
      }
    } else if(buttonText=="="){
      num2= double.parse(output);
      if (operacion=="+"){
        _output=(num1+num2).toString();
      }
      if (operacion=="-"){
        _output=(num1-num2).toString();
      }
      if (operacion=="X"){
        _output=(num1*num2).toString();
      }
      if (operacion=="/"){
        _output=(num1/num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operacion = "";

    } else{
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      
      output=double.parse(_output).toStringAsFixed(2);

    });

  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24),

          // shape: CircleBorder(),
        ), 
        onPressed: () {  
          buttonPressed(buttonText);
        },
        child: Text(buttonText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        ),
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 12,
            ),
            child: Text(output,
            style:TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ))),
          const Expanded(
            child: Divider(),
          ),
          Column(children: [

            Row(children: [
              buildButton("7"),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ]),

            Row(children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('X'),
            ]),

            Row(children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ]),

            Row(children: [
              buildButton('.'),
              buildButton('0'),
              buildButton('00'),
              buildButton('+'),
            ]),

            Row(children: [
              buildButton('Clear'),
              buildButton('='),
            ]),

          ]),
        ]),
      ),
    );
  }
}
