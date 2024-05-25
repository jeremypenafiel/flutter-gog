
import 'package:flutter/material.dart';
import 'package:gog/backend/prematch_board.dart';
import 'package:provider/provider.dart';

const Color darkSquareColor = Colors.brown;
const Color lightSquareColor = Colors.white;
const Color highlightColor = Colors.yellowAccent;
const Color takeSquareColor = Colors.red;

class PrematchBoardTile extends StatefulWidget {
  final int index;
  final Widget? child;
  const PrematchBoardTile({super.key, required this.index, required this.child});

  @override
  State<PrematchBoardTile> createState() => _PrematchBoardTileState();

}

class _PrematchBoardTileState extends State<PrematchBoardTile>{
  @override
  Widget build(BuildContext context) {

    return Consumer<PrematchBoard>(
      builder: (BuildContext context, PrematchBoard prematchBoard, Widget? child) {
        Color tileColor = widget.index % 2 == 0? lightSquareColor: darkSquareColor;
        if(widget.index == prematchBoard.selectedTileIndex){
          tileColor = highlightColor;
        }
        bool isPlaceableTile = widget.index >= 9 && prematchBoard.getSelectedTileIndex() != null;
        Widget tileContainer  = Container(
          color: tileColor,
          child: widget.child,
        );
        return GestureDetector(
          onTap: () => isPlaceableTile ? prematchBoard.movePiece(widget.index) : null,
          child: !isPlaceableTile ? tileContainer:  DragTarget <int> (
            onWillAcceptWithDetails: (details){
              return true;
              //details.data is ang data gina pass sa piece aka ang startSquare sang piece
              // if(isPossibleMove|| isPossibleTakeMove){
              //   return true;
              // }
              // return false;
            },
            onAcceptWithDetails: (details){
              prematchBoard.movePiece(widget.index);
              // if(isPossibleMove){
              //   board.movePiece(widget.index, details.data);
              // }else if(isPossibleTakeMove){
              //   board.takePiece(widget.index, details.data);
              // }
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