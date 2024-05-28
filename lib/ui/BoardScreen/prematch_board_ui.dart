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
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleChildScrollView(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 9,
            shrinkWrap: true,
            children: List.generate(36, (index) {
              return PrematchBoardTile(index: index,);
              },
            ),
          ),
        ),
      ],
    );
  }
}
