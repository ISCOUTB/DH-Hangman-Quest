import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(HangmanQuestApp());
}

class HangmanQuestApp extends StatelessWidget {
  const HangmanQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Quest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// Pantalla principal con el nombre del juego y botones
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman Quest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hangman Quest',
              style: TextStyle(
                fontSize: 36, // Tamaño de fuente grande
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color del texto
              ),
            ),
            const SizedBox(height: 40), // Espaciado antes de los botones
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NicknameScreen()),
                );
              },
              child: const Text('Registrar Apodo'),
            ),
            const SizedBox(height: 20), // Espaciado entre los botones
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestScreen()),
                );
              },
              child: const Text('Jugar como Invitado'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla para ingresar el apodo
class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  NicknameScreenState createState() => NicknameScreenState();
}

class NicknameScreenState extends State<NicknameScreen> {
  final _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Apodo'),
      ),
      body: Center( // Centrar todo en la pantalla
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nicknameController,
                decoration: const InputDecoration(
                  labelText: 'Ingresa tu apodo',
                  hintText: 'Máximo 25 caracteres',
                ),
                maxLength: 25, // Limitar a 25 caracteres
                maxLengthEnforcement: MaxLengthEnforcement.enforced, // Enforzar la longitud máxima
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_nicknameController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameModesScreen(
                          nickname: _nicknameController.text,
                          isGuest: false,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Por favor, ingresa un apodo válido'),
                    ));
                  }
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pantalla para usuarios que juegan como invitados
class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modo Invitado'),
      ),
      body: Center( // Centrar los botones en la pantalla
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameModesScreen(
                  nickname: 'Invitado',
                  isGuest: true,
                ),
              ),
            );
          },
          child: const Text('Continuar como Invitado'),
        ),
      ),
    );
  }
}

// Pantalla de selección de modos de juego con restricción para invitados
class GameModesScreen extends StatelessWidget {
  final String nickname;
  final bool isGuest;

  const GameModesScreen({super.key, required this.nickname, required this.isGuest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modos de Juego'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido, $nickname',
              style: const TextStyle(
                fontSize: 24, // Aumentar el tamaño del texto
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Espaciado antes de los botones
            ElevatedButton(
              onPressed: isGuest ? null : () {
                      // Navega al modo Competitivo
                    },
              child: const Text('Modo Competitivo'),
            ),
            const SizedBox(height: 20), // Espaciado entre los botones
            ElevatedButton(
              onPressed: () {
                // Navega al modo Normal
              },
              child: const Text('Modo Normal'),
            ),
            const SizedBox(height: 20), // Espaciado entre los botones
            ElevatedButton(
              onPressed: () {
                // Navega al modo Arcade
              },
              child: const Text('Modo Arcade'),
            ),
          ],
        ),
      ),
    );
  }
}

// Función para eliminar los datos de sesión del usuario invitado al finalizar
void endGuestSession(BuildContext context) {
  // Limpiar datos temporales
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => HomePage()),
    (Route<dynamic> route) => false,
  );
}