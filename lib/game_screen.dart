import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/const/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letter.dart';
import 'package:hangman/main.dart';



class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
  var word = palabras[Random().nextInt(palabras.length)].toUpperCase();
  List<String> selectedChar = [];
  var tries = 0;
  

  

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
                  flex: 4 ,
                  child: Stack(
                    children: [
                      figure(GameUI.hang, tries >=0),
                      figure(GameUI.head, tries >=1),
                      figure(GameUI.body, tries >=2),
                      figure(GameUI.leftArm, tries >=3),
                      figure(GameUI.rightArm, tries >=4),
                      figure(GameUI.leftLeg, tries >=5),
                      figure(GameUI.rightLeg, tries >=6)
                    ] 
                    ),
                  ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: word.split("").map(
                        (e) => hiddenLetter(e, !selectedChar.contains(e.toUpperCase())),
                      ).toList(),
                    )
                    ),
                  )
              ],
            ) 
            ),
          Expanded(
            flex: 2,
            child: Container(
            padding: const EdgeInsets.all(8.0),
             child: GridView.count(
              crossAxisSpacing: 4,
             mainAxisSpacing: 4,
             crossAxisCount: 7,
             children: characters.split("").map((e){
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bgColor
                ),
                onPressed: selectedChar.contains(e.toUpperCase()) ? null :() {
                  setState(() {
                    selectedChar.add(e.toUpperCase());
                    if(!word.split("").contains(e.toUpperCase())){
                      tries++;
                    }
                     if (tries >= 6) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                );
                              }
                            }
                          ) ;
                },
                 child: Text(
                  e,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                 ),
                 );
             }).toList(),),
              ))
        ],
      ),
    );
  }
}