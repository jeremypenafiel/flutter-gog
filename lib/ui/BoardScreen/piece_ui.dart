import 'package:flutter/material.dart';

class PieceUI extends StatelessWidget{
  const PieceUI({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Draggable(
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