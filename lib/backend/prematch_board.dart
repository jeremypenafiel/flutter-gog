import 'package:flutter/foundation.dart';
import 'package:gog/backend/piece.dart';


import 'board.dart';


class PrematchBoard extends ChangeNotifier{

  PrematchBoard(){
    pieceColor = turn == 0 ? Piece.white: Piece.black;
    int j = 0;
    prematchBoard[0] = Piece.white | Piece.flag;
    prematchBoard[1] = Piece.white | Piece.spy;
    prematchBoard[2] = Piece.white | Piece.spy;

    for(int i = 0; i < maxSquareNum; i++){
      bool innerSquare = i % 9 != 0 && i % 9 != 8 && i ~/ 9 != 0 ;

      /*
      if (innerSquare){
        List<int> pieceList = pieceMap.values.toList();
        if(i >= 21){
          continue;
        }
        prematchBoard[i] = pieceList[j];
        j++;*/



    }


  }
  int? selectedTileIndex;
  int turn = 0;
  List<int> prematchBoard = List<int>.filled(36, 0);
  final int maxSquareNum = 36;

  final List<int> moveOffsets = [-9, 9, -1, 1];
  bool isWhiteTurn = true;
  late int pieceColor;

  final Map<int, int> pieceMap = {
    Piece.flag: 1,
    Piece.private: 6,
    Piece.spy: 2,
    Piece.sergeant: 1,
    Piece.secondLt: 1,
    Piece.firstLt: 1,
    Piece.captain: 1,
    Piece.major: 1,
    Piece.ltCol: 1,

    Piece.col: 1,
    Piece.oneStarGen: 1,
    Piece.twoStarGen: 1,
    Piece.threeStarGen: 1,
    Piece.fourStarGen: 1,
    Piece.fiveStarGen: 1,
  };



  final int flag = 1;
  final int private = 6;
    final int spy = 2;
    final int sergeant = 1;

    final int secondLt= 1;
    final int firstLt = 1;
    final int captain = 1;
    final int major = 1;

    final int ltCol = 1;
    final int col = 1;
    final int oneStarGen = 1;
    final int twoStarGen = 1;

    final int threeStarGen = 1;
    final int fourStarGen = 1; // 0010 0000 0000 0000
    final int fiveStarGen = 1; //

  get getTurn => turn;
  //get getSelectedTileIndex => selectedTileIndex;
  int? getSelectedTileIndex(){
    return selectedTileIndex;
  }
  void onPieceSelected(int startSquare){
    selectedTileIndex = startSquare;
  }

  void movePiece(int targetSquare){
    if(selectedTileIndex == null){
      return;
    }

    var temp = prematchBoard[targetSquare];
    prematchBoard[targetSquare] = prematchBoard[selectedTileIndex!];
    prematchBoard[selectedTileIndex!] = temp;
    selectedTileIndex = null;
    notifyListeners();
  }

}