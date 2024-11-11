import 'package:flutter/material.dart';
import 'dart:convert';

class AppColors {
  static const bgColor = Color(0xff2C3333);
  static const textColor = Color(0xffE7F6F2); 
}

class GameUI {
  static const body = "assets/body.png";
  static const hang = "assets/hang.png";
  static const head = "assets/head.png";
  static const leftArm = "assets/l_arm.png";
  static const rightArm = "assets/r_arm.png";
  static const leftLeg = "assets/l_leg.png";
  static const rightLeg = "assets/r_leg.png";

}

const List<String> palabras = [
  "perro", "gato", "carro", "puerta", "ventana", "manzana", "computadora", "programacion", "flutter", "dart"
];

String jsonString = '''
  {
    "words": [
      "PERRO",
      "GATO",
      "ELEFANTE",
      "TIGRE",
      "LEÓN",
      "CABALLO",
      "Delfín",
      "BALLENA",
      "SERPIENTE",
      "MANZANA",
      "PLÁTANO",
      "FRESA",
      "UVA",
      "PIÑA",
      "NARANJA",
      "CIRUELA",
      "KIWI",
      "MANGO",
      "COCO",
      "ROJO",
      "AZUL",
      "VERDE",
      "AMARILLO",
      "NEGRO",
      "BLANCO",
      "NARANJA",
      "MORADO",
      "ROSADO",
      "GRIS",
      "MADRID",
      "BARCELONA",
      "SEVILLA",
      "VALENCIA",
      "ZARAGOZA",
      "MÁLAGA",
      "CÁDIZ",
      "CÓRDOBA",
      "BILBAO",
      "PALMA",
      "LÁMPARA",
      "SILLA",
      "ESCRITORIO",
      "TELEVISOR",
      "MESA",
      "CARTERA",
      "TELÉFONO",
      "LIBRO",
      "BOLÍGRAFO",
      "CUADERNO"
    ]
  }
  ''';

  // Decodificar el JSON
  Map<String, dynamic> jsonData = jsonDecode(jsonString);

  // Obtener el array de palabras del JSON
  List<String> palabrasFromJson = jsonData['words'].cast<String>();

  

  // Combinar ambas listas (puedes usar un Set para eliminar duplicados si es necesario)
 List<String> palabrasCombinadas = [...palabras, ...palabrasFromJson];


