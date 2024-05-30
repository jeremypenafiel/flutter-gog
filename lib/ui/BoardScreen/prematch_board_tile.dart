
import 'package:flutter/material.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:gog/backend/prematch_board.dart';
import 'package:gog/ui/BoardScreen/prematch_piece_ui.dart';
import 'package:provider/provider.dart';

const Color darkSquareColor = Colors.brown;
const Color lightSquareColor = Colors.white;
const Color highlightColor = Colors.yellowAccent;
const Color takeSquareColor = Colors.red;

class PrematchBoardTile extends StatefulWidget {
  final int index;
  const PrematchBoardTile({super.key, required this.index});

  @override
  State<PrematchBoardTile> createState() => _PrematchBoardTileState();

}

class _PrematchBoardTileState extends State<PrematchBoardTile>{
  @override
  Widget build(BuildContext context) {

    return Consumer<PrematchBoard>(
      builder: (BuildContext context, PrematchBoard prematchBoard, Widget? child) {
        bool hasPiece = prematchBoard.tentativeBoard[widget.index] != 0;
        Color tileColor = widget.index % 2 == 0? lightSquareColor: darkSquareColor;
        bool isPlaceableTile = widget.index >= 9 && prematchBoard.getSelectedTileIndex() != null;

        Widget? child = hasPiece ?  PrematchPieceUI(
                            startSquare: widget.index,
                            pieceType: prematchBoard.tentativeBoard[widget.index],
                          ) : null;

        if(widget.index == prematchBoard.selectedTileIndex){
          tileColor = highlightColor;
        }

        Widget tileContainer  = Container(
          color: tileColor,
          child: child,
        );

        return GestureDetector(
          onTap: () {
            AudioManager().playSfx('Sounds/piece-on-drop-sfx.mp3');
            isPlaceableTile ? prematchBoard.movePiece(widget.index) : null;
          },
          child:  DragTarget <int> (
            onWillAcceptWithDetails: (details){
              if(isPlaceableTile){ // will accept drag if valid tile
                return true;
              }
              return false;
            },
            onAcceptWithDetails: (details){
              AudioManager().playSfx('Sounds/piece-on-drop-sfx.mp3');
              prematchBoard.movePiece(widget.index);
            },
            builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
              return tileContainer;
            },
          ),
        );
      },

    );
  }


}