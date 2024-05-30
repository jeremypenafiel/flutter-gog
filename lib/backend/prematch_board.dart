import 'package:flutter/foundation.dart';
import 'package:gog/backend/piece.dart';


import 'board.dart';


class PrematchBoard extends ChangeNotifier{


  PrematchBoard(){
    //initBoard(whitePrematchBoard);
  }
  int? selectedTileIndex;
  int turn = 0;
  List<int> whitePrematchBoard = List<int>.filled(36, 0);
  List<int> blackPrematchBoard = List<int>.filled(36, 0);
  List<int> tentativeBoard = List<int>.filled(36, 0);
  List<int> finalBoard = List<int>.filled(72, 0);
  final int maxSquareNum = 36;
  late int pieceColor;

final List<int> pieceList = [
  Piece.flag,
  Piece.private,
  Piece.private,
  Piece.private,
  Piece.private,
  Piece.private,
  Piece.private,
  Piece.spy,
  Piece.spy,
  Piece.sergeant,
  Piece.secondLt,
  Piece.firstLt,
  Piece.captain,
  Piece.major,
  Piece.ltCol,
  Piece.col,
  Piece.oneStarGen,
  Piece.twoStarGen,
  Piece.threeStarGen,
  Piece.fourStarGen,
  Piece.fiveStarGen,
];

  int prematchPhase = 1;
  get getBoard => finalBoard;
  get getTurn => turn;

  void changeTurn(){
    turn = turn == 0 ? 1: 0;
    initBoard(blackPrematchBoard, 1);
  }

  int? getSelectedTileIndex(){
    return selectedTileIndex;
  }
  void onPieceSelected(int startSquare){
    if(selectedTileIndex == null){
      selectedTileIndex = startSquare;
      notifyListeners();
      return;
    }

    if(selectedTileIndex == startSquare){
      selectedTileIndex = null;
    }
    notifyListeners();

  }

  void movePiece(int targetSquare){
    var temp = tentativeBoard[targetSquare];
    tentativeBoard[targetSquare] = tentativeBoard[selectedTileIndex!];
    tentativeBoard[selectedTileIndex!] = temp;
    selectedTileIndex = null;
    notifyListeners();
  }

  void mergeBoards(){
    blackPrematchBoard = blackPrematchBoard.reversed.toList();
    finalBoard =  blackPrematchBoard + whitePrematchBoard ;
  }

  void whiteSetup(){
    selectedTileIndex = null;
    initBoard(whitePrematchBoard, 0);
    notifyListeners();
  }

  void initBoard(List<int> board, int turn){
    pieceColor = turn == 0 ? Piece.white: Piece.black; // turn 0 is white, turn 1 is black
    int j = 0;

    for(int i = 10; i < maxSquareNum; i++) {
      bool innerSquare = i % 9 != 8 && i % 9 != 0;

      if (innerSquare) {
        if(j >= 21){
          continue;
        }
        board[i] = pieceColor | pieceList[j];
        j++;

      }

      tentativeBoard = board;
      notifyListeners();
    }
  }

  void blackSetup() {
    selectedTileIndex = null;
    initBoard(blackPrematchBoard, 1);
    notifyListeners();
  }

  void resetTentativeBoard() {
    tentativeBoard = List<int>.filled(36, 0);
    notifyListeners();
  }

  void resetBoard() {
    turn = 0;
    whitePrematchBoard = List<int>.filled(36, 0);
    blackPrematchBoard = List<int>.filled(36, 0);
    resetTentativeBoard();
    whiteSetup();
  }

}