// ignore_for_file: prefer_const_constructors

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
  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(24),

          // shape: CircleBorder(),
        ), 
        onPressed: () {  },
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
          const Text("0"),
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
