import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/backend/board.dart';
// import change notifier

import 'package:gog/backend/prematch_board.dart';

enum GameState{
  whitePrematch,
  blackPrematch,
  purgatory,

  inGame,
  postGame
}

class GameController extends ChangeNotifier{
  Board board;
  PrematchBoard prematchBoard;
  var gameState = ValueNotifier<GameState>(GameState.whitePrematch);

  GameController({required this.board, required this.prematchBoard});

  void connect(Board board, PrematchBoard prematchBoard){
    board = board;
    prematchBoard = prematchBoard;
  }


  void startPrematch(){
    gameState = ValueNotifier<GameState>(GameState.whitePrematch);
    prematchBoard.whiteSetup();
  }

  void onReady(){
    switch (gameState.value){
      case GameState.whitePrematch:
        gameState.value = GameState.blackPrematch;
        prematchBoard.changeTurn();
        prematchBoard.blackSetup();
        break;

      case GameState.blackPrematch:
        gameState.value = GameState.inGame;
        gameState.notifyListeners();
        prematchBoard.mergeBoards();
        board.setBoard(prematchBoard.getBoard);
        print(board.board);
        break;
      case GameState.inGame:
        print( "ingame");
        //gameState = GameState.postGame;
        break;
      case GameState.postGame:
        //gameState = GameState.whitePrematch;
        //prematchBoard.whiteSetup();
        break;
      case GameState.purgatory:
        // TODO: Handle this case.
    }
      print("gameState: $gameState");

  }


}