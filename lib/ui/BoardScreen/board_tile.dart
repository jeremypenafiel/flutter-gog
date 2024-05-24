
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/board.dart';
const Color darkSquareColor = Colors.brown;
const Color lightSquareColor = Colors.white;
const Color highlightColor = Colors.yellowAccent;
const Color takeSquareColor = Colors.red;

class BoardTile extends StatefulWidget{
  final int index;
  final Widget? child;
  const BoardTile({super.key, required this.index, required this.child});

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  @override
  Widget build(BuildContext context) {

    Color tileColor;
    bool accepted = false;
    return Consumer<Board>(
      builder: (BuildContext context, Board board, Widget? child) {

        bool isPossibleMove = board.isPossibleMove(widget.index);
        bool isPossibleTakeMove = board.isPossibleTakeMove(widget.index);

        tileColor = widget.index % 2 == 0 ? lightSquareColor: darkSquareColor;

        if(isPossibleMove || board.isSelectedTile(widget.index)) {
          tileColor = highlightColor;
        }else if(isPossibleTakeMove){
          tileColor = takeSquareColor;
        }

        return GestureDetector(
          onTap: (){
            if(isPossibleMove) {
              board.movePiece(widget.index, board.getSelectedTileIndex);
            }else if(isPossibleTakeMove){
              board.takePiece(widget.index, board.getSelectedTileIndex);
            }
          },
          child: DragTarget <int> (
            onWillAcceptWithDetails: (details){
              //details.data is ang data gina pass sa piece aka ang startSquare sang piece
              if(isPossibleMove|| isPossibleTakeMove){
                return true;
              }
              return false;
            },
            onAcceptWithDetails: (details){
              if(isPossibleMove){
                board.movePiece(widget.index, details.data);
              }else if(isPossibleTakeMove){
                board.takePiece(widget.index, details.data);
              }
            },
            builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
              return Container(
                color: tileColor,
                child: widget.child,
              );
            },
          ),
        );
      }
    );
  }
}