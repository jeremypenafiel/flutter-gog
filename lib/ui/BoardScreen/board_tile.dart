
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../backend/board.dart';
const Color darkSquareColor = Colors.brown;
const Color lightSquareColor = Colors.white;
const Color highlightColor = Colors.yellowAccent;

class BoardTile extends StatefulWidget{
  final int index;
  final Widget child;
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
        tileColor = widget.index % 2 == 0 ? lightSquareColor: darkSquareColor;

        if(isPossibleMove || board.isSelectedTile(widget.index)) {
          tileColor = highlightColor;
        }

        return GestureDetector(
          onTap: (){
            if(isPossibleMove) {
              board.movePiece(widget.index, board.getSelectedTileIndex);
            }
          },
          child: DragTarget <int> (
            onWillAcceptWithDetails: (details){
              //details.data is ang data gina pass sa piece aka ang startSquare sang piece
              if(board.getPossibleMoves(details.data).contains(widget.index) == true){
                return true;
              }
              print(details.data);
              return false;
            },
            onAcceptWithDetails: (details){
              if(board.getPossibleMoves(details.data).contains(widget.index) == true){
                setState(() {
                  print("Move piece to ${widget.index}");
                  board.movePiece(widget.index, details.data);
                });
                accepted = true;
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