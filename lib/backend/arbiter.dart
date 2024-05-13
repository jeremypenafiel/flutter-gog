import 'package:gog/backend/piece.dart';

class Arbiter {
  // made static since we don't need to create multiple instances of this class

  static final Arbiter _arbiter = Arbiter._internal();

  factory Arbiter() {
    return _arbiter;
  }

  Arbiter._internal();

  int checkMove(int initiatingPiece, int targetPiece) {
    var initiatingPieceRank = Piece.pieceType(initiatingPiece);
    var targetPieceRank = Piece.pieceType(targetPiece);

    if (targetPieceRank ==  initiatingPieceRank){
      return targetPieceRank == Piece.flag? initiatingPiece: Piece.none;
    }

    // check if either piece is a spy and other piece is a private
    if (initiatingPieceRank == Piece.spy && (targetPieceRank == Piece.private)){
      return targetPiece;
    }else if (targetPieceRank == Piece.spy && (initiatingPieceRank == Piece.private)){
      return initiatingPiece;
    }

    if(initiatingPieceRank == Piece.spy && targetPieceRank != Piece.private){
      return initiatingPiece;
    }else if(targetPieceRank == Piece.spy && initiatingPieceRank != Piece.private){
      return targetPiece;
    }

    var returnPiece = targetPieceRank > initiatingPieceRank ? targetPiece : initiatingPiece;
    return returnPiece;
  }
}