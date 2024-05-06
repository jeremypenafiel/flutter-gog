import 'package:gog/backend/Piece.dart';

class Arbiter {
  // made static since we don't need to create multiple instances of this class

  static final Arbiter _arbiter = Arbiter._internal();

  factory Arbiter() {
    return _arbiter;
  }

  Arbiter._internal();

  Piece checkMove(Piece initiatingPiece, Piece targetPiece) {
    return initiatingPiece;
  }
}