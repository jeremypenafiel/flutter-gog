import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/ui/BoardScreen/prematch_board_ui.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/board_screen_bottom_nav_bar.dart';
import 'package:gog/ui/BoardScreen/prematch_board_tile.dart';
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: _selectedIndex == 0
              ? ChangeNotifierProvider(
                  create: (context) => PrematchBoard(),
                  child:PrematchBoardUI(),
                  //add two buttons here
                )
                : BoardUI(),
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
