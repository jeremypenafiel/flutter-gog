import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:provider/provider.dart';

import '../../backend/board.dart';
import '../../backend/piece.dart';
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


class GraveyardWidget extends StatelessWidget {
  const GraveyardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 38, 38, 38),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildGraveyardColumn(context, 1, true), // Player One graveyard
          ),
          Container(
            width: 1.0,
            color: Colors.white, 
          ),
          Expanded(
            child: _buildGraveyardColumn(context, 2, false), // Player Two graveyard
          ),
        ],
      ),
    );
  }

  Widget _buildGraveyardColumn(BuildContext context, int playerNumber, bool isWhiteGraveyard) {
    return Consumer<Board>(builder: (context, Board board, child) {
      var graveyard = isWhiteGraveyard ? board.whiteGraveyard : board.blackGraveyard;

      return ListView.builder(
      itemCount: (graveyard.length / 2).ceil(),
      itemBuilder: (context, index) {               // placeholder lang pero gaincrement dapat so if wala pa deds, wala pa dapat display
        int firstPieceIndex = index * 2;
        int secondPieceIndex = firstPieceIndex + 1;
        
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildGraveyardPiece(context, playerNumber, graveyard[firstPieceIndex]),
                ),
                Expanded(
                  child: secondPieceIndex < graveyard.length
                    ? _buildGraveyardPiece(context, playerNumber, graveyard[secondPieceIndex])
                    : Container(),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            )
          ]
        );
      }
    );
  });
  }

  Widget _buildGraveyardPiece(BuildContext context, int playerNumber, int pieceType) {
    var gameController = Provider.of<GameController>(context);

    return ValueListenableBuilder(
        valueListenable: gameController.gameState,
        builder: (BuildContext context, GameState gameState, Widget? child) {
          bool isPieceTurn = false;
          if(Piece.isColor(pieceType, Piece.white) && gameState == GameState.whiteTurn){
            isPieceTurn = true;
          }else if (Piece.isColor(pieceType, Piece.black) && gameState == GameState.blackTurn){
            isPieceTurn = true;
          }
          int tileFace =  isPieceTurn? pieceType: Piece.color(pieceType);
          return Image.asset(pieceMap[tileFace]);
        }
    );
  }
}
