import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:outlined_text/outlined_text.dart';

class PurgatoryUI extends StatelessWidget {
  final GameController gameController;

  const PurgatoryUI({super.key, required this.gameController});

  @override
  Widget build(BuildContext context) {
    var turn = gameController.turn;
    bool isWhiteTurn = turn == 0; // turn == 0 is white's turn
    String turnText = !isWhiteTurn ? 'White' : 'Black';
    Color textColor = !isWhiteTurn ? Colors.white : Colors.black;
    Color outlineColor = !isWhiteTurn ? Colors.black : Colors.white;
    return Center(
      child: Stack(
        children: [
            OutlinedText(
              text: Text('$turnText Player\'s Turn', 
                  style: TextStyle(
                      color: textColor, 
                      fontSize:30
                  )
              ),
              strokes: [
                  OutlinedTextStroke(
                      color: outlineColor, 
                      width: 5),
              ],
          )
        ],
      ),
    );
  }
}

