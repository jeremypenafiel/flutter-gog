import 'package:flutter/material.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:provider/provider.dart';
import '../../backend/piece.dart';
import '../../backend/prematch_board.dart';

const Map pieceMap = {
  Piece.white|Piece.firstLt: 'assets/White Pieces/white_1st_lieut.png',
  Piece.white|Piece.oneStarGen: 'assets/White Pieces/white_1star_general.png',

  Piece.white|Piece.secondLt: 'assets/White Pieces/white_2nd_lieut.png',
  Piece.white|Piece.twoStarGen: 'assets/White Pieces/white_2star_general.png',
  Piece.white|Piece.threeStarGen: 'assets/White Pieces/white_3star_general.png',
  Piece.white|Piece.fourStarGen: 'assets/White Pieces/white_4star_general.png',
  Piece.white|Piece.fiveStarGen: 'assets/White Pieces/white_5star_general.png',
  Piece.white|Piece.captain: 'assets/White Pieces/white_captain.png',
  Piece.white|Piece.col: 'assets/White Pieces/white_colonel.png',
  Piece.white: 'assets/White Pieces/white_down.png',
  Piece.white|Piece.flag: 'assets/White Pieces/white_flag.png',
  Piece.white|Piece.ltCol: 'assets/White Pieces/white_lt_colonel.png',
  Piece.white|Piece.major: 'assets/White Pieces/white_major.png',
  Piece.white|Piece.private: 'assets/White Pieces/white_private.png',
  Piece.white|Piece.sergeant: 'assets/White Pieces/white_sergeant.png',
  Piece.white|Piece.spy: 'assets/White Pieces/white_spy.png',

  Piece.black|Piece.firstLt: 'assets/Black Pieces/black_1st_lieut.png',
  Piece.black|Piece.secondLt: 'assets/Black Pieces/black_2nd_lieut.png',
  Piece.black|Piece.twoStarGen: 'assets/Black Pieces/black_2star_general.png',
  Piece.black|Piece.threeStarGen: 'assets/Black Pieces/black_3star_general.png',
  Piece.black|Piece.fourStarGen: 'assets/Black Pieces/black_4star_general.png',
  Piece.black|Piece.fiveStarGen: 'assets/Black Pieces/black_5star_general.png',
  // Piece.black|Piece.oneStarGen: 'assets/Black Pieces/black_1star_general.png',
  Piece.black|Piece.captain: 'assets/Black Pieces/black_captain.png',
  Piece.black|Piece.col: 'assets/Black Pieces/black_colonel.png',
  Piece.black: 'assets/Black Pieces/black_down.png',
  Piece.black|Piece.flag: 'assets/Black Pieces/black_flag.png',
  Piece.black|Piece.oneStarGen: 'assets/Black Pieces/black_general.png',
  Piece.black|Piece.ltCol: 'assets/Black Pieces/black_lt_colonel.png',
  Piece.black|Piece.major: 'assets/Black Pieces/black_major.png',
  Piece.black|Piece.private: 'assets/Black Pieces/black_private.png',
  Piece.black|Piece.sergeant: 'assets/Black Pieces/black_sergeant.png',
  Piece.black|Piece.spy: 'assets/Black Pieces/black_spy.png',
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


          return IgnorePointer(
            ignoring: prematchBoard.getSelectedTileIndex() != null && prematchBoard.getSelectedTileIndex() != startSquare,


            child: GestureDetector(
              onTap: () {
                prematchBoard.onPieceSelected(startSquare);
                AudioManager().playSfx('Sounds/piece-on-tap-sfx.mp3');
              },

              child: Draggable<int>(
                dragAnchorStrategy: (_, __, ___) => const Offset(50, 50),
                onDragStarted: () {
                  onTileSelected?.call(startSquare);
                  AudioManager().playSfx('Sounds/piece-on-tap-sfx.mp3');
                },
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
