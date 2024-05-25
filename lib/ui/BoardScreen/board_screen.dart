import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:gog/main.dart';
import 'package:gog/ui/BoardScreen/prematch_board_ui.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/board_screen_bottom_nav_bar.dart';
import 'package:gog/backend/prematch_board.dart';
import 'package:gog/ui/BoardScreen/board_screen_buttons.dart';
import 'package:provider/provider.dart';

import '../../backend/board.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameController?.startPrematch();

  }

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context, listen: false);
    if(gameController.prematchBoard == null){

    }

    var board = ValueListenableBuilder<GameState>(
        valueListenable: gameController.gameState,
        builder: (context, gameState, child) {
          print("hello, state is $gameState");
          return gameState == GameState.whitePrematch || gameState == GameState.blackPrematch
              ? ChangeNotifierProvider.value(
                  value: gameController.prematchBoard,
                  child: PrematchBoardUI(),
                  //add two buttons here
                )
              : ChangeNotifierProvider(
                  create: (BuildContext context) => gameController.board,
                  child: BoardUI());
        });

    return Scaffold(
        appBar: null,
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
          )),
          Positioned.fill(
              child: Container(
            color: Colors.black.withOpacity(0.3),
          )),
          Container(
            padding: const EdgeInsets.only(
              top: 35,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/Title.png'),
                    ),
                    Spacer(),
                    const Icon(Icons.settings)
                  ]),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                    child: board,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: BoardScreenButtons(
                    onReadyPressed: () {
                      //TODO: Handle ready button
                      gameController.onReady();
                    },
                    onExitPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                  ),
                ),
                const Expanded(
                  child: BoardScreenBottomNavBar(),
                ),
              ],
            ),
          ),
        ]));
  }
}
