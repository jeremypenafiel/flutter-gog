import 'package:flutter/material.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/board_screen_bottom_nav_bar.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generals'),
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 5, // 40% of the screen
            child: BoardUI(),
          ),
          Expanded(
            flex: 5, // 60% of the screen
            child: BoardScreenBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
