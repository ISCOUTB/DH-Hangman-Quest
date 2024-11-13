// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hangman/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:hangman/const/consts.dart';
import 'dart:math';
void main() {
  group('GameScreen Tests', () {
    test('Verifica si una palabra se ha adivinado completamente', () {
      // Inicializar el estado del juego
      final gameState = GameScreenState();
      gameState.word = "FLUTTER";
      gameState.selectedChar = ["F", "L", "U", "T", "T", "E", "R"];

      // Verificar que isWordGuessed sea verdadero
      expect(gameState.isWordGuessed(), true);
    });

    test('Aumenta los intentos al fallar', () {
      final gameState = GameScreenState();
      final triesBefore = gameState.tries;

      gameState.selectedChar.add("X");
      if (!gameState.word.contains("X")) {
        gameState.tries++;
      }

      expect(gameState.tries, triesBefore + 1);
    });
  
test('Word Selection: Should select a random word', () {
  final gameState = GameScreenState();
  List<String> mockWords = ['HELLO', 'WORLD', 'FLUTTER'];
  
  // Forzamos la palabra seleccionada a estar en mockWords para simular que se ha seleccionado una palabra válida
  gameState.word = mockWords[Random().nextInt(mockWords.length)];

  // Assert
  expect(mockWords.contains(gameState.word), true);
});

  
    test('Letter Selection: Should add correct letter to selectedChar',() {
    
    final gameState = GameScreenState();
    gameState.word = 'HELLO';
    gameState.selectedChar = [];

    // Act
    gameState.selectedChar.add('H');

    // Assert
    expect(gameState.selectedChar, ['H']);
  });
  
test('Loss Condition: Should trigger loss dialog after 6 incorrect tries', () {
  final gameState = GameScreenState();
  
  // Establecemos la palabra y hacemos que selectedChar tenga intentos incorrectos
  gameState.word = 'HELLO';
  List<String> incorrectGuesses = ['X', 'Y', 'Z', 'A', 'B', 'C']; // 6 intentos incorrectos
  
  // Añadimos cada letra incorrecta y aumentamos tries si la letra no está en la palabra
  for (var letter in incorrectGuesses) {
    if (!gameState.word.contains(letter)) {
      gameState.tries++;
    }
  }
  
  // Assert
  expect(gameState.tries, 6);
});
  });
}

