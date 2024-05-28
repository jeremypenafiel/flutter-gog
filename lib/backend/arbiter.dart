import 'package:gog/backend/piece.dart';

class Arbiter {
  // made static since we don't need to create multiple instances of this class

  static final Arbiter _arbiter = Arbiter._internal();

  factory Arbiter() {
    return _arbiter;
  }

  Arbiter._internal();

  int checkMove(int initiatingPiece, int targetPiece, List<int> whiteGraveyard, List<int> blackGraveyard) {
    var initiatingPieceRank = Piece.pieceType(initiatingPiece);
    var targetPieceRank = Piece.pieceType(targetPiece);

    int winningPiece;
    int losingPiece;

    if (targetPieceRank ==  initiatingPieceRank){
      if(Piece.isColor(initiatingPiece, Piece.white)){
        whiteGraveyard.add(initiatingPiece);
        blackGraveyard.add(targetPiece);
      }else{
        blackGraveyard.add(initiatingPiece);
        whiteGraveyard.add(targetPiece);
      }
      return targetPieceRank == Piece.flag? initiatingPiece: Piece.none;
    }

    // check if either piece is a spy and other piece is a private
    if (initiatingPieceRank == Piece.spy && (targetPieceRank == Piece.private)){
      winningPiece = targetPiece;
      losingPiece = initiatingPiece;
      if(Piece.isColor(winningPiece, Piece.white)){
        blackGraveyard.add(losingPiece);
      }else{
        whiteGraveyard.add(losingPiece);
      }

      return winningPiece;
    }else if (targetPieceRank == Piece.spy && (initiatingPieceRank == Piece.private)){
       winningPiece = initiatingPiece;
       losingPiece = targetPiece;
        if(Piece.isColor(winningPiece, Piece.white)) {
          blackGraveyard.add(losingPiece);
        }else{
          whiteGraveyard.add(losingPiece);
        }
        return winningPiece;
    }




    if(initiatingPieceRank == Piece.spy && targetPieceRank != Piece.private){
      winningPiece =  initiatingPiece;
      losingPiece = targetPiece;

      if(Piece.isColor(winningPiece, Piece.white)) {
        blackGraveyard.add(losingPiece);
      }else{
        whiteGraveyard.add(losingPiece);
      }

      return initiatingPiece;

    }else if(targetPieceRank == Piece.spy && initiatingPieceRank != Piece.private){
      winningPiece = targetPiece;
      losingPiece = initiatingPiece;

      if(Piece.isColor(winningPiece, Piece.white)){
        blackGraveyard.add(losingPiece);
      }else{
        whiteGraveyard.add(losingPiece);
      }
      return targetPiece;
    }

    winningPiece = targetPieceRank > initiatingPieceRank ? targetPiece : initiatingPiece;
    losingPiece = targetPieceRank > initiatingPieceRank ? initiatingPiece : targetPiece;

    if(Piece.isColor(winningPiece, Piece.white)){
      blackGraveyard.add(losingPiece);
    }else{
      whiteGraveyard.add(losingPiece);
    }

    return winningPiece;
  }
}
