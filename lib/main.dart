
import 'package:calculadora_flutter/bloc/bloc_provider.dart';
import 'package:calculadora_flutter/bloc/calculadora_bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/calculadora_bloc.dart';
import 'widgets/boton.dart';
final List<String> botones = ['C','+/-','%','DEL','7','8','9','/','4','5','6','x','1','2','3','-','0','.','=','+'];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CalculadoraBloc(),
      child: MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
          primarySwatch: Colors.indigo
        ),
        home: const MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var input = '', answer = '';
  

  @override
  Widget build(BuildContext context){
    final blocCalculadora = BlocProvider.of<CalculadoraBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
      ),
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
            child:Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      input,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: _buildAnswer(blocCalculadora),
                    )
                ]
              )
            )
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: botones.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index){
                  return Boton(
                    botonPresionado:(){
                      print("Se presiono $index");
                      blocCalculadora.pressKeySink.add(index);
                    },
                    textoBoton: botones[index],
                    colorFondo: Colors.blue[50],
                    colorTexto: Colors.black,
                  );
                }
              )
            )
          ),
        ]
      )
    );
  }

  Widget _buildAnswer(CalculadoraBloc bloc){
    return StreamBuilder<String?>(
      stream: bloc.calculadoraStream,
      builder: (context, snapshot){
        print("StreamBuilder:${snapshot.data}");
        var answer="0";
        if (snapshot.data != null){
          answer = snapshot.data.toString();
        }
        return Text(
          answer,
          style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        );
      }
    );
  }
}
