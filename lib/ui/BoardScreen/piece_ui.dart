import 'package:flutter/material.dart';

class PieceUI extends StatelessWidget{
  final List<int>? possibleMoves;
  const PieceUI({super.key, required this.possibleMoves});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Draggable<List<int>>(
      data: possibleMoves,
      childWhenDragging: Container(),
      feedback: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          )
      ),
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        )
      ),

    );
  }

}