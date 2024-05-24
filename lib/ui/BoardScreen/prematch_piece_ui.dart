import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../backend/board.dart';
import '../../backend/piece.dart';
import '../../backend/prematch_board.dart';

const Map pieceMap = {
  Piece.white|Piece.col: 'assets/White Pieces/white_colonel.png',
  Piece.white|Piece.captain: 'assets/White Pieces/white_captain.png',
  Piece.black|Piece.col: 'assets/Black Pieces/black_colonel.png',
  Piece.black|Piece.captain: 'assets/Black Pieces/black_captain.png',
  Piece.white|Piece.spy: 'assets/White Pieces/white_spy.png',
  Piece.black|Piece.spy: 'assets/Black Pieces/black_spy.png',
  Piece.white|Piece.private: 'assets/White Pieces/white_private.png',
  Piece.black|Piece.private: 'assets/Black Pieces/black_private.png',
  Piece.white|Piece.flag: 'assets/White Pieces/white_flag.png',
  Piece.black|Piece.flag: 'assets/Black Pieces/black_flag.png',
  Piece.white: 'assets/White Pieces/white_down.png',
  Piece.black: 'assets/Black Pieces/black_down.png',
};

class PrematchPieceUI extends StatelessWidget{
  final int startSquare;
  final int pieceType;
  const PrematchPieceUI({super.key, required this.startSquare, required this.pieceType});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrematchBoard>(
        builder: (BuildContext context, PrematchBoard prematchBoard, Widget? child) {
          bool isWhiteTurn = prematchBoard.getTurn == 0 && Piece.isColor(pieceType, Piece.white);
          bool isBlackTurn = prematchBoard.getTurn == 1 && Piece.isColor(pieceType, Piece.black);
          int tileFace = isWhiteTurn || isBlackTurn ? pieceType: Piece.color(pieceType);
          var onTileSelected = isWhiteTurn || isBlackTurn ? prematchBoard.onPieceSelected: null;
          return AbsorbPointer(
            absorbing: !isWhiteTurn && !isBlackTurn,
            child: GestureDetector(
              onTap: () {
                onTileSelected?.call(startSquare);
              },

              child: Draggable<int>(
                onDragStarted: () => onTileSelected?.call(startSquare),
                data: startSquare,
                childWhenDragging: Container(),
                feedback: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                        image:AssetImage(pieceMap[pieceType]),
                      ),
                    )
                ),
                child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                        image:AssetImage(pieceMap[tileFace]),
                      ),
                    )
                ),

              ),
            ),
          );
        }
    );
  }

}
