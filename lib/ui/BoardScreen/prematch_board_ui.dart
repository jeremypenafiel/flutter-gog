import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/ui/BoardScreen/board_tile.dart';
import 'package:gog/ui/BoardScreen/piece_ui.dart';
import 'package:gog/ui/BoardScreen/prematch_board_tile.dart';
import 'package:gog/ui/BoardScreen/prematch_piece_ui.dart';
import 'package:provider/provider.dart';
import '../../backend/prematch_board.dart';

class PrematchBoardUI extends StatefulWidget {
  const PrematchBoardUI({super.key});

  @override
  State<PrematchBoardUI> createState() => _PrematchBoardUIState();
}

class _PrematchBoardUIState extends State<PrematchBoardUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add a container with a border
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          // Use Expanded to allow the GridView to expand within the available space
          child: Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 9,
                shrinkWrap: true,
                children: List.generate(36, (index) {
                  return Consumer<PrematchBoard>(
                    builder: (BuildContext context, PrematchBoard board, Widget? child) {
                      bool hasPiece = board.whitePrematchBoard[index] != 0;
                      return PrematchBoardTile(
                        index: index,
                        child: hasPiece
                            ? PrematchPieceUI(
                                startSquare: index,
                                pieceType: board.whitePrematchBoard[index],
                              )
                            : null,
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ),
        // Add buttons below the board
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Transfer to next state/player
              },
              child: Text('Ready'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Exit'),
            ),
          ],
        ),
      ],
    );
  }
}