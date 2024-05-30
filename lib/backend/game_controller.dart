import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:gog/backend/board.dart';
import 'package:gog/backend/piece.dart';
import 'package:gog/ui/PopUpScreen/popup.dart';
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
  int whitePlayerScore = 0;
  int blackPlayerScore = 0;


  int turn = 0; // turn = 0 means white turn, turn = 1 means black turn
  var gameState = ValueNotifier<GameState>(GameState.whitePrematch);

  GameController();

  void connect(Board board, PrematchBoard prematchBoard){
    this.board = board;
    this.prematchBoard = prematchBoard;
  }

  void resetBoard(){
    gameState.value = GameState.whitePrematch;
    gameState.notifyListeners();
    board.resetBoard();
    turn = 0;
    prematchBoard.resetBoard();

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
        resetBoard();
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

  void win(int winningColor){
    gameState.value = GameState.postGame;
    if(winningColor == Piece.white){
      whitePlayerScore++;
    }else{
      blackPlayerScore++;
    }

    
    print("WIN");
    
    notifyListeners();
    AudioManager().playSfx('Sounds/victory-sfx.mp3');

  }

  void resetScore() {
    whitePlayerScore = 0;
    blackPlayerScore = 0;
  }


}