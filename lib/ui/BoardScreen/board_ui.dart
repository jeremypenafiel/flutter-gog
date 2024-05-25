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


  @override
  Widget build(BuildContext context) {
      print("boardUI build called");
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 9,
        children:
          List.generate(72, (index) {
            return Consumer<Board>(
              builder: (BuildContext context, Board board, Widget? child) {
                bool hasPiece = board.board[index] != 0;
                return
                  BoardTile( // Piece is rendered here
                    index: index,
                    child: hasPiece
                        ? PieceUI(
                      startSquare: index, pieceType: board.board[index],)
                        : null,
                  );
              }
            );
          }
          )
      );
  }
}