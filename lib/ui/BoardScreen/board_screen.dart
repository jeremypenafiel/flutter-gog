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
import 'package:gog/ui/PopUpScreen/popup.dart';

import '../../backend/board.dart';
import 'package:gog/backend/audio_manager.dart';


class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> with WidgetsBindingObserver {
  final int _selectedIndex = 0;
  late Board board;
  late PrematchBoard prematchBoard;
  late ValueNotifier<GameState> gameStateNotifier;
  late GameController gameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameController = Provider.of<GameController>(context, listen: false);
    board = Board(setGameState: gameController.setGameState, onWin: gameController.win);
    WidgetsBinding.instance.addObserver(this);
    prematchBoard = PrematchBoard();
    gameController.connect(board, prematchBoard);

    gameController.resetBoard();
    gameController.startPrematch();
    print("start match");

    

    AudioManager().stopBackgroundMusic().then((_) {
      AudioManager().playBackgroundMusic('Sounds/game-bg-music.mp3');
    });


    gameStateNotifier = gameController.gameState;
    gameStateNotifier.addListener(_onGameStateChanged);
  }

  
  @override
  void dispose() {
    // Remove the observer in dispose
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Check if the app is transitioning to paused state
    if (state == AppLifecycleState.paused) {
      // Pause audio playback
      AudioManager().pauseBackgroundMusic();
    } else if (state == AppLifecycleState.resumed) {
      // Resume audio playback
      AudioManager().resumeBackgroundMusic();
    }
  }

void _onGameStateChanged() {
    if (gameController.gameState.value == GameState.postGame) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Popup(popup: 2);
            },
          );
        }
      });
    }
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

                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('assets/Title.png'),
                      ),
                      Spacer(),
                      IconButton(icon: Icon(Icons.settings), 
                      onPressed:() {
                        showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Popup(popup: 1);
                      },
                      );
                      }
                      )
                    ]
                  ) ,

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
                    onExitPressed: () async {
                      await AudioManager().stopBackgroundMusic();
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
