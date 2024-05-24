import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/board_screen_bottom_nav_bar.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 34, 18, 0),
            child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                child: Image.asset('assets/Title.png'),
              ),
              Icon(Icons.settings)
            ]
          ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: BoardUI(),
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
