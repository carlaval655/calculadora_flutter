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
        primarySwatch: Colors.deepOrange,
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
    if (buttonText=="AC"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operacion="";
    } else if(buttonText=="del"){
      int pos = _output.length - 1;
      _output = _output.substring(0, pos);

    }else if(buttonText=="+" || buttonText=="-" || buttonText=="X" || buttonText=="/"){//Significa que el usuario ya ingreso un numero e ingresara el siguiente
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
          padding: EdgeInsets.all(30),
          backgroundColor: Colors.blueGrey,
          shape: CircleBorder(),
        ), 
        onPressed: () {  
          buttonPressed(buttonText);
        },
        child: Text(buttonText,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
            decoration: BoxDecoration(color: Colors.black),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 83.1,
              horizontal: 12,
            ),
            child: Text(output,
            style:TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ))),

          Container(
            decoration: BoxDecoration(color:Colors.black),
            padding: EdgeInsets.all(2),
            child: Column(children: [
              Row(
                children: [
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
                buildButton('='),
                buildButton('+'),
              ]),
          
              Row(children: [
                buildButton('AC'),
                buildButton("del"),
              ]),
          
            ]),
          ),
        ]),
      ),
    );
  }
}
