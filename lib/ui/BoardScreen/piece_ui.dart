import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../backend/board.dart';
import '../../backend/piece.dart';

const Map pieceMap = {Piece.white|Piece.col: 'assets/pieces/colonel(1).png'};

class PieceUI extends StatelessWidget{
  final int startSquare;
  final int pieceType;
  const PieceUI({super.key, required this.startSquare, required this.pieceType});

  @override
  Widget build(BuildContext context) {
    Color pieceColor = Piece.isColor(pieceType, Piece.white)? Colors.white: Colors.black;
    return Consumer<Board>(
        builder: (BuildContext context, Board board, Widget? child) {
          return GestureDetector(
            onTap: () {
              board.setSelectedTileIndex = startSquare;
              board.getPossibleMoves(startSquare);
              },

            child: Draggable<int>(
              onDragStarted: (){
                board.setSelectedTileIndex = startSquare;
                board.getPossibleMoves(startSquare);
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
                      image:AssetImage(pieceMap[pieceType]),
                    ),
                  )
              ),

            ),
          );
        }
    );
  }

}