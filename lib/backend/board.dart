import 'package:flutter/animation.dart';
import 'package:gog/backend/piece.dart';

class Board {
  static const int _maxRanks = 8;
  static const int _maxFiles = 9;

  List<int> board = List<int>.filled(72, 0);


  void revealPieces(int pieceColor){
    for(int i = 0; i < board.length; i++){
      if(board[i] == pieceColor){
        board[i] = 0;
      }
    }
  }

  Piece revealPiece(Piece p iece){
    return piece;
  }

  bool isValidMove(int moveIndex, int pieceIndex){
    int pieceRank = pieceIndex ~/ _maxRanks; //0
    int pieceFile = pieceIndex % _maxFiles; // 8

    int moveRank = moveIndex ~/ _maxRanks; // 1
    int moveFile = moveIndex % _maxFiles; //0

    int rankDifference = (moveRank - pieceRank).abs();
    int fileDifference = (moveFile - pieceFile).abs();


    return (rankDifference - fileDifference).abs() == 1;
  }
}