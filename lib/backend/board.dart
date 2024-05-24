import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gog/backend/arbiter.dart';
import 'package:gog/backend/piece.dart';

class Board extends ChangeNotifier {

  Board(){
    board[0] = Piece.white | Piece.spy;
    board[1] = Piece.black | Piece.private;

    board[9] = Piece.white | Piece.private;
    board[10] = Piece.black | Piece.spy;

    board[18] = Piece.white | Piece.captain;
    board[19] = Piece.black | Piece.captain;
    board[20] = Piece.white| Piece.flag;
    board[21] = Piece.black | Piece.flag;

  }

  int turn = 0;
  final int maxSquareNum = 72;
  static const int _maxRanks = 8;
  static const int _maxFiles = 9;
  final List<int> moveOffsets = [-_maxFiles, _maxFiles, -1, 1];

  int? selectedTileIndex;
  List<int> possibleMoves = List.empty(growable: true);

   List<int> possibleTakeMoves = List.empty(growable: true);

  List<int> board = List<int>.filled(72, 0);


  void revealPieces(int pieceColor){
    for(int i = 0; i < board.length; i++){
      if(board[i] == pieceColor){
        board[i] = 0;
      }
    }
  }

  Piece revealPiece(Piece piece){
    notifyListeners();
    return piece;
  }

  bool isValidMove(int targetSquare, int startSquare){
    int startRank = startSquare ~/ _maxFiles;
    int startFile = startSquare % _maxFiles;

    int targetRank = targetSquare ~/ _maxFiles;
    int targetFile = targetSquare % _maxFiles;

    int rankDifference = (targetRank - startRank).abs();
    int fileDifference = (targetFile - startFile).abs();

    return (rankDifference - fileDifference).abs() == 1;
  }

  void
  calculatePossibleMoves(int startSquare){
    possibleMoves = [];
    possibleTakeMoves = [];
    for(int offset in moveOffsets){
      int targetSquare = startSquare + offset;

      if(targetSquare < 0 || targetSquare >= maxSquareNum){
        continue;
      }

      if(!isValidMove(targetSquare, startSquare)) {
        continue;
      }


     if(!Piece.isColor(board[targetSquare], Piece.color(board[startSquare])) && board[targetSquare] != Piece.none){
       possibleTakeMoves.add(targetSquare);
      }
      if (board[targetSquare] == Piece.none) {
        possibleMoves.add(targetSquare);
      }
    }
    possibleTakeMoves = possibleTakeMoves;
    possibleMoves = possibleMoves;

  }

  void movePiece(int targetSquare, int startSquare){
    print("ah lente");
    board[targetSquare] = board[startSquare];
    board[startSquare] = 0;
    selectedTileIndex = null;
    possibleMoves = List.empty(growable: true);
    possibleTakeMoves = List.empty(growable: true);
    turn = (turn + 1) % 2;
    notifyListeners();
  }

  set setSelectedTileIndex(int index){
    selectedTileIndex = index;
    notifyListeners();
  }

  get getTurn{
    return turn;
  }

  get getSelectedTileIndex{
    return selectedTileIndex;
  }

  bool isPossibleMove(int index){
    return possibleMoves.contains(index);
  }

  bool isPossibleTakeMove(int index){
    return possibleTakeMoves.contains(index);
  }

  bool isSelectedTile(int index){
    return selectedTileIndex == index;
  }

  void takePiece(int targetPieceIndex, int initiatingPieceIndex) {

    board[targetPieceIndex] = Arbiter().checkMove(board[initiatingPieceIndex], board[targetPieceIndex]);
    board[initiatingPieceIndex] = 0;
    selectedTileIndex = null;
    possibleMoves = List.empty(growable: true);
    possibleTakeMoves = List.empty(growable: true);
    turn = (turn + 1) % 2;
    notifyListeners();
  }

  void onPieceSelected(int startSquare){
    setSelectedTileIndex = startSquare;
    calculatePossibleMoves(startSquare);
  }

  get getPossibleTakeMoves {
    return possibleTakeMoves;
  }

  get getPossibleMoves{
    return possibleMoves;
  }




}