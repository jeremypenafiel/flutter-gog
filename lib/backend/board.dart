import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:gog/backend/piece.dart';

class Board extends ChangeNotifier {

  Board(){
    board[0] = Piece.white | Piece.flag;
  }

  final int maxSquareNum = 72;
  static const int _maxRanks = 8;
  static const int _maxFiles = 9;
  final List<int> moveOffsets = [-_maxFiles, _maxFiles, -1, 1];

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

  List<int> getPossibleMoves(int startSquare){
    List<int> possibleMoves = [];
    for(int offset in moveOffsets){
      int targetSquare = startSquare + offset;
      if(targetSquare >= 0 && targetSquare < maxSquareNum){
        if(isValidMove(targetSquare, startSquare)){
          possibleMoves.add(targetSquare);
        }
      }
    }
    return possibleMoves;

  }

  void movePiece(int targetSquare, int startSquare){
    board[targetSquare] = board[startSquare];
    board[startSquare] = 0;
    notifyListeners();
  }




}