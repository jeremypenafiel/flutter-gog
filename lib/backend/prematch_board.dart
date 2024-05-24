import 'package:flutter/foundation.dart';
import 'package:gog/backend/piece.dart';


import 'board.dart';


class PrematchBoard extends ChangeNotifier{

  PrematchBoard(){
    initBoard(whitePrematchBoard);
  }
  int? selectedTileIndex;
  int turn = 0;
  List<int> whitePrematchBoard = List<int>.filled(36, 0);
  List<int> blackPrematchBoard = List<int>.filled(36, 0);
  List<int> finalBoard = List<int>.filled(72, 0);

  final int maxSquareNum = 36;

  final List<int> moveOffsets = [-9, 9, -1, 1];
  bool isWhiteTurn = true;
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


  get getBoard => finalBoard;
  get getTurn => turn;
  set setTurn(int turn){
    this.turn = turn;
    notifyListeners();
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
    var temp = whitePrematchBoard[targetSquare];
    whitePrematchBoard[targetSquare] = whitePrematchBoard[selectedTileIndex!];
    whitePrematchBoard[selectedTileIndex!] = temp;
    selectedTileIndex = null;
    notifyListeners();
  }

  void mergeBoards(){
    blackPrematchBoard = blackPrematchBoard.reversed.toList();
    finalBoard = whitePrematchBoard + blackPrematchBoard;
  }

  void initBoard(List<int> board){
    pieceColor = turn == 0 ? Piece.white: Piece.black;
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
    }
  }

}