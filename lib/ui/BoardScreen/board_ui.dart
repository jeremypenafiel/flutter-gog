import 'package:flutter/material.dart';
import 'package:gog/ui/BoardScreen/board_tile.dart';
import 'package:gog/ui/BoardScreen/piece_ui.dart';
import 'package:provider/provider.dart';

import '../../backend/board.dart';

class BoardUI extends StatefulWidget {

  const BoardUI({super.key});

  @override
  State<BoardUI> createState() => _BoardUIState();

}

class _BoardUIState extends State<BoardUI> {
  final Color darkSquareColor = Colors.brown;
  final Color lightSquareColor = Colors.white;
  final Color highlightColor = Colors.yellowAccent;
  int? selectedTileIndex;
  List<int>? possibleMoves;

  @override
  Widget build(BuildContext context) {
    return
      Consumer<Board>(
        builder: (BuildContext context, Board board, Widget? child) {
          return GridView.count(
            crossAxisCount: 9,
            children:
              List.generate(72, (index) {
                bool hasPiece = board.board[index] != 0;
                bool isPossibleMove = possibleMoves?.contains(index) == true;
                Color? tileColor;

                tileColor = index % 2 == 0 ? lightSquareColor: darkSquareColor;
                if(hasPiece && index == selectedTileIndex || isPossibleMove){
                  tileColor = highlightColor;
               }
               return
                 GestureDetector(
                   onTapDown: (details){
                     setState(() {

                        if(hasPiece){
                          possibleMoves = board.getPossibleMoves(index);
                        }else if(isPossibleMove){
                          print("Move piece to $index");
                          board.movePiece(index, selectedTileIndex!);
                          selectedTileIndex = null;
                          possibleMoves = null;
                        }
                        else{
                          possibleMoves = null;
                        }
                        selectedTileIndex = index;
                      });
                    } ,
                   child: BoardTile(
                     // Piece is rendered here
                     index: index,
                     tileColor: tileColor,
                     child:  hasPiece? PieceUI(possibleMoves: possibleMoves,) :Text(index.toString(), style: TextStyle(fontSize: 10),),
                   ),
                );
            }
          )
        );
        },
      );
  }
}