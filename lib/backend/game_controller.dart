import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/backend/board.dart';
import 'package:gog/backend/piece.dart';
// import change notifier

import 'package:gog/backend/prematch_board.dart';

enum GameState{
  whitePrematch,
  blackPrematch,
  purgatory,
  whiteTurn,
  blackTurn,
  postGame
}

class GameController extends ChangeNotifier{
  late Board board;
  late PrematchBoard prematchBoard;
  int turn = 0;
  var gameState = ValueNotifier<GameState>(GameState.whitePrematch);

  GameController();

  void connect(Board board, PrematchBoard prematchBoard){
    this.board = board;
    this.prematchBoard = prematchBoard;
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
        gameState.value = GameState.whiteTurn;
        gameState.notifyListeners();
        prematchBoard.mergeBoards();
        board.setBoard(prematchBoard.getBoard);
        print(board.board);
        break;
      case GameState.postGame:
        break;
      case GameState.purgatory:
        gameState.value = turn == 0 ? GameState.blackTurn : GameState.whiteTurn;
        turn = turn == 0 ? 1 : 0;
        int pieceColor = gameState.value == GameState.whiteTurn ? Piece.white : Piece.black;
        //board.revealPieces(pieceColor);

        break;
      case GameState.whiteTurn:
      case GameState.blackTurn:
        break;
    }
      print("gameState: $gameState");

  }

  void setGameState(){
    gameState.value = GameState.purgatory;
    notifyListeners();
  }


}