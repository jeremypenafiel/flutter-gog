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
import 'backend/audio_manager.dart';




GameController? gameController;
void main() {
  gameController = GameController();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FontProvider()),
        ChangeNotifierProvider(create: (context) => gameController),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FontProvider>(
        builder: (BuildContext context, FontProvider fontProvider,
            Widget? child) {
          AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
        return MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/',
              routes: {
                '/': (context) => HomePage(),
                '/board': (context) => const BoardScreen(),
                '/settings': (context) => Popup(popup: 1),
              },
              theme: ThemeData(
                textTheme: GoogleFonts.getTextTheme(fontProvider.selectedFont),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ));
        }
    );
  }
}
