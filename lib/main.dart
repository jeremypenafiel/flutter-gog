import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/backend/board.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:gog/ui/BoardScreen/board_screen.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/prematch_board_ui.dart';
import 'package:gog/ui/HomeScreen/home.dart';
import 'package:gog/ui/PopUpScreen/settings.dart';
import 'package:provider/provider.dart';

import 'backend/prematch_board.dart';

GameController? gameController;
void main() {
  gameController = GameController(board: Board(),prematchBoard:  PrematchBoard());


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/board': (context) => MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => gameController),
          ChangeNotifierProvider(create: (context) => gameController?.board),
          ChangeNotifierProvider(create: (context) => gameController?.prematchBoard),
        ],
        child: const BoardScreen()),
        '/prematch_board': (context) => ChangeNotifierProvider(create: (context) => PrematchBoard(), child: const PrematchBoardUI()),
        
        '/settings': (context) => SettingsPopup(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

