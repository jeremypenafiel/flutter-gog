import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';

class PurgatoryUI extends StatelessWidget {
  final GameController gameController;

  const PurgatoryUI({super.key, required this.gameController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder<GameState>(
        valueListenable: gameController.gameState,
        builder: (context, gameState, child) {
          bool isWhiteTurn = gameState == GameState.whiteTurn;
          String turnText = isWhiteTurn ? 'White' : 'Black';
          Color textColor = isWhiteTurn ? Colors.white : Colors.black;
          Color outlineColor = isWhiteTurn ? Colors.black : Colors.white;
          return Stack(
            children: [
              // Outline text
              Text(
                '$turnText Player\'s Turn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = outlineColor,
                ),
              ),
              // Main text
              Text(
                '$turnText Player\'s Turn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

