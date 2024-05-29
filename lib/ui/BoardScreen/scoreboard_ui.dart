import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/game_controller.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var gameController = Provider.of<GameController>(context, listen: false);
    var score = ValueListenableBuilder(
        valueListenable: gameController.gameState,
        builder: (context, gameState, child) {
          return Text(
            'Player One ${gameController.whitePlayerScore} - ${gameController.blackPlayerScore} Player Two',
            style: const TextStyle(
              color: Colors.white, // Text color
            ),
          );
        },
    );

    return Container(
      decoration: const BoxDecoration(
        border: Border( 
          top: BorderSide(color: Colors.white), 
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 38, 38, 38),
                padding: const EdgeInsets.symmetric(vertical: 8.0), 
                child:  Center(
                  child: score
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}