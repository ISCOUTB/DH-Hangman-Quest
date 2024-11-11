import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/const/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letter.dart';



class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnñopqrstuvwxyz".toUpperCase();
  var word = palabrasCombinadas[Random().nextInt(palabrasCombinadas.length)].toUpperCase();
  List<String> selectedChar = [];
  var tries = 0;

  //se adivinó la palabra
  bool isWordGuessed() {
    return word.split("").every((letter) => selectedChar.contains(letter));
  }

  //diálogo al adivinar la palabra
  void showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // ignore: deprecated_member_use
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
         child: AlertDialog(
        title: const Text("¡Correcto!"),
        content: Text("La palabra es: $word"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                // reinicia el juego
                word = palabrasCombinadas[Random().nextInt(palabrasCombinadas.length)].toUpperCase();
                selectedChar.clear();
                tries = 0;
              });
              Navigator.of(context).pop(); // cierra el diálogo
            },
            child: const Text("Volver a jugar"),
          ),
        ],
      ),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hangman-Quest"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      figure(GameUI.hang, tries >= 0),
                      figure(GameUI.head, tries >= 1),
                      figure(GameUI.body, tries >= 2),
                      figure(GameUI.leftArm, tries >= 3),
                      figure(GameUI.rightArm, tries >= 4),
                      figure(GameUI.leftLeg, tries >= 5),
                      figure(GameUI.rightLeg, tries >= 6),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: word
                          .split("")
                          .map((e) => hiddenLetter(e, !selectedChar.contains(e.toUpperCase())))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 5,
                children: characters.split("").map((e) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.bgColor),
                    onPressed: selectedChar.contains(e.toUpperCase())
                        ? null
                        : () {
                            setState(() {
                              selectedChar.add(e.toUpperCase());
                              if (!word.split("").contains(e.toUpperCase())) {
                                tries++;
                              }
                              if (tries >= 6) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => WillPopScope(
                                        onWillPop: () async => false,
                                        child: AlertDialog(
                                        title: const Text("Ahogado"),
                                        content: const Text("No tienes más intentos."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                // reinicia el juego
                                                word = palabrasCombinadas[Random().nextInt(palabrasCombinadas.length)].toUpperCase();
                                                selectedChar.clear();
                                                tries = 0;
                                              });
                                              Navigator.of(context).pop(); // cierra el diálogo
                                            },
                                            child: const Text("Volver a jugar"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                              } else if (isWordGuessed()) {
                                showWinDialog();
                              }
                            });
                          },
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}