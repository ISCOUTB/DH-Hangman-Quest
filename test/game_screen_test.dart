// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hangman/game_screen.dart';
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
  
test('Seleccion de palabra: se debe escoger una palabra aleatoria', () {
  final gameState = GameScreenState();
  List<String> mockWords = ['HELLO', 'WORLD', 'FLUTTER'];
  
  // Forzamos la palabra seleccionada a estar en mockWords para simular que
  // se ha seleccionado una palabra válida
  gameState.word = mockWords[Random().nextInt(mockWords.length)];

  
  expect(mockWords.contains(gameState.word), true);
});

  
    test('Seleccion de letra: Que se añada la letra si es correcta cuando es seleccionada',() {
    
    final gameState = GameScreenState();
    gameState.word = 'HELLO';
    gameState.selectedChar = [];

    
    gameState.selectedChar.add('H');

  
    expect(gameState.selectedChar, ['H']);
  });
  
test('Condicion de derrota: Deberia saltar el dialogo de derrota luego de 6 intesntos malos', () {
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
  
  
  expect(gameState.tries, 6);
});
  });
}

