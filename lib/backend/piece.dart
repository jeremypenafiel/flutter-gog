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
  static const int fourStarGen = 8192; // 0010 0000 0000 0000
  static const int fiveStarGen = 16384; // 0100 0000 0000 0000
  static const int white = 32768;  //  1000 0000 0000 0000
  static const int black = 65536;  // 0001 0000 0000 0000 0000

  static int typeMask = 32767;  // 0111 1111 1111 1111
  static int colorMask = 98304; // 0001 1000 0000 0000 0000


  static bool isColor(int piece, int color) {
    return (piece & color) == color;
  }
  static int color(int piece) {
    return piece & colorMask;
  }

  static int pieceType(int piece) {
    print(piece);
    print(typeMask);
    return piece & typeMask;
  }
}