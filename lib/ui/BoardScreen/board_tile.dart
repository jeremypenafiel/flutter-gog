
import 'package:flutter/material.dart';

class BoardTile extends StatefulWidget{
  final int index;
  final Color tileColor;
  final Widget child;
  const BoardTile({super.key, required this.index, required this.tileColor, required this.child});

  @override
  State<BoardTile> createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool accepted = false;
    return DragTarget <List<int>> (
      onWillAcceptWithDetails: (details){
        if(details.data.contains(widget.index)){

          return true;
        }
        print(details.data);
        return false;
      },
      onAcceptWithDetails: (details){
        if(details.data.contains(widget.index)){
          accepted = true;
           }
        }
    ,
      builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
        return Container(
          color: widget.tileColor,
          child: widget.child,
        );
        },
    );
  }
}