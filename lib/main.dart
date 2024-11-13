import 'package:flutter/material.dart';
import 'package:hangman/game_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hangman-Quest",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment:Alignment.center,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 90),//espacio titulo-imagen
            Image.asset(
              'assets/ahorcado.png',  
              width: 300,  
              height: 300, 
            ),
                //sin espacio imagen-boton
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameScreen()),
                );
              },
              child: const Text(
                "Jugar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), 
          ],
        ),
        ),
      ),
    );
  }
}


