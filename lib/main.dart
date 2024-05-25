import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gog/ui/PopUpScreen/settings.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gog/backend/font_provider.dart';
import 'backend/game_controller.dart';
import 'ui/HomeScreen/home.dart';
import 'backend/board.dart';
import 'ui/BoardScreen/board_screen.dart';
import 'backend/prematch_board.dart';
import 'ui/BoardScreen/prematch_board_ui.dart';



GameController? gameController;
void main() {
  gameController = GameController(board: Board(),prematchBoard:  PrematchBoard());
  runApp(
    ChangeNotifierProvider(
      create: (_) => FontProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FontProvider>(
      builder: (BuildContext context, FontProvider fontProvider, Widget? child) {
      return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/board': (context) =>
              MultiProvider(providers: [
                ChangeNotifierProvider(create: (context) => gameController),
                ChangeNotifierProvider(
                    create: (context) => gameController?.board),
                ChangeNotifierProvider(
                    create: (context) => gameController?.prematchBoard),
              ],
                  child: const BoardScreen()),
          '/prematch_board': (context) =>
              ChangeNotifierProvider(create: (context) => PrematchBoard(),
                  child: const PrematchBoardUI()),

          '/settings': (context) => SettingsPopup(),
        },
          theme: ThemeData(
            textTheme: GoogleFonts.getTextTheme(fontProvider.selectedFont),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ));
        }
    );
  }
