import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gog/backend/font_provider.dart';
import 'ui/HomeScreen/home.dart';
import 'backend/board.dart';
import 'ui/BoardScreen/board_screen.dart';
import 'backend/prematch_board.dart';
import 'ui/BoardScreen/prematch_board_ui.dart';
import 'backend/audio_manager.dart';


void main() {
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
      builder: (context, fontProvider, child) {
        AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
        return MaterialApp(
          title: 'Flutter Demo',
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/board': (context) => ChangeNotifierProvider(create: (context) => Board(), child: const BoardScreen()),
            '/prematch_board': (context) => ChangeNotifierProvider(create: (context) => PrematchBoard(), child: const PrematchBoardUI()),
          },
          theme: ThemeData(
            textTheme: GoogleFonts.getTextTheme(fontProvider.selectedFont),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
