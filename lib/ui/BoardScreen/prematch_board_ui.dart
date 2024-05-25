import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';
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
        Expanded(
          child: GridView.count(
            crossAxisCount: 9,
            children: List.generate(36, (index) {
              return Consumer<PrematchBoard>(
                builder: (BuildContext context, PrematchBoard board, Widget? child) {
                  bool hasPiece = board.tentativeBoard[index] != 0;
                  return
                  PrematchBoardTile( // Piece is rendered here
                    index: index,
                    child: hasPiece
                        ? PrematchPieceUI(
                            startSquare: index,
                            pieceType: board.tentativeBoard[index],
                          )
                        : null,
                    // child: Text('$index', style: TextStyle(fontSize: 10),),
                  );
                }
              );
            },
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              // TODO: Transfer to next state/player
              Provider.of<GameController>(context, listen: false).onReady();
            },
            child: Text('Ready'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text('Exit'),
          ),
          ElevatedButton(onPressed: (){
            //Provider.of<PrematchBoard>(context, listen: false).prematchPhaseSetter(0);
          },
              child: Text("Start"))
        ],
      ),
    ],
    );
  }
}
