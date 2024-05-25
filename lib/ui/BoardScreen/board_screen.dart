import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:gog/ui/BoardScreen/prematch_board_ui.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/board_screen_bottom_nav_bar.dart';
import 'package:gog/backend/prematch_board.dart';
import 'package:provider/provider.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context, listen: false);
    gameController.startPrematch();
    final prematchBoard = gameController.prematchBoard;

    var board = ValueListenableBuilder<GameState>(
        valueListenable: gameController.gameState,
        builder: (context, gameState, child) {
          print("hello, state is $gameState");
          return
            gameState != GameState.inGame ? ChangeNotifierProvider(
        create: (context) => prematchBoard,
        child: PrematchBoardUI(),
        //add two buttons here
      )
          : ChangeNotifierProvider(
          create: (BuildContext context) => gameController.board,
          child: BoardUI());
    });
    /*
    var board = Selector<GameController, GameState>(
      selector: (context, gameController) => gameController.gameState,
      builder: (context, gameState, child) {
        print("hello, state is $gameState");
        return
        gameController.gameState != GameState.inGame
            ? ChangeNotifierProvider(
          create: (context) => prematchBoard,
          child: PrematchBoardUI(),
          //add two buttons here
        )
            : ChangeNotifierProvider(
            create: (BuildContext context) => gameController.board,
            child: BoardUI());
      },
    );
    */


    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 40, 18, 0),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30,
                child: Image.asset('assets/Title.png'),
              ),
              Icon(Icons.settings)
            ]
          ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: board
            ),
          ),
          const Expanded(
            child: BoardScreenBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
