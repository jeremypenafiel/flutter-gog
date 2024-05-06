import 'package:gog/backend/Piece.dart';

class Board {
  List<int> board = List<int>.filled(72, 0);


  void revealPieces(int pieceColor){
    for(int i = 0; i < board.length; i++){
      if(board[i] == pieceColor){
        board[i] = 0;
      }
    }
  }

  Piece revealPiece(Piece piece){
    return piece;
  }

}