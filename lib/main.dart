import 'package:flutter/material.dart';
import 'package:games_app/memory_game/home_page.dart';
import 'package:games_app/tic_tac_toe_game/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: GameScreen());
  }
}
