import 'package:flutter/material.dart';

import 'game_board.dart';

void main() {
  runApp(const SmartChess());
}

class SmartChess extends StatelessWidget {
  const SmartChess({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameBoard(),
    );
  }
}
