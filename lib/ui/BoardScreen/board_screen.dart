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
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight,
                  child: const BoardUI(),
                );
              },
            ),
          ),
          const Flexible(
            flex: 6,
            child: BoardScreenBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
