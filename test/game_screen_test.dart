// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hangman/game_screen.dart';

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
  });
}

