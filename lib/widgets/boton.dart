import 'package:flutter/material.dart';

class Boton extends StatelessWidget{
  final colorFondo;
  final colorTexto;
  final String textoBoton;
  final botonPresionado;

  Boton(
    {this.colorFondo,
    this.colorTexto,
    required this.textoBoton,
    this.botonPresionado,
    }
  );

  Widget build(BuildContext context){
    return GestureDetector(
      onTap: botonPresionado,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRect(
          child: Container(
            color: colorFondo,
            child: Center(
              child: Text(
                textoBoton,
                style: TextStyle(
                  color:colorTexto,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )
              )
            )
          ),
        )
      )
    );
  }
}