 class Piece {
  static const int none = 0;

  static const int flag = 1;
  static const int private = 2;
  static const int spy = 4;
  static const int sergeant = 8;

  static const int secondLt= 16;
  static const int firstLt = 32;
  static const int captain = 64;
  static const int major = 128;

  static const int ltCol = 256;
  static const int col = 512;
  static const int oneStarGen = 1024;
  static const int twoStarGen = 2048;

  static const int threeStarGen = 4096;
  static const int fourStarGen = 8192;
  static const int fiveStarGen = 16384;
  static const int white = 32768;
  static const int black = 65536;

  static int typeMask = int.parse("0111 1111 1111 1111", radix: 2);
  static int colorMask = int.parse("0001 1000 0000 0000 0000", radix: 2);


  static bool isColor(int piece, int color) {
    return (piece & color) == color;
  }
  static int color(int piece) {
    return piece & colorMask;
  }

  static int pieceType(int piece) {
    return piece & typeMask;
  }
}