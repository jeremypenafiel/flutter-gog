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
          String playerOne = gameController.isSwapped ? 'Player Two' : 'Player One';
          String playerTwo = gameController.isSwapped ? 'Player One' : 'Player Two';
          return Text(
            '$playerOne ${gameController.whitePlayerScore} - ${gameController.blackPlayerScore} $playerTwo',
            style: const TextStyle(
            color: Colors.white, // Text colorText color
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