import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/ui/BoardScreen/prematch_board_ui.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';
import 'package:gog/ui/BoardScreen/board_screen_bottom_nav_bar.dart';
import 'package:gog/ui/BoardScreen/prematch_board_tile.dart';
import 'package:gog/backend/prematch_board.dart';
import 'package:gog/ui/BoardScreen/board_screen_buttons.dart';
import 'package:provider/provider.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            )
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            )
          ),
          Container(
            padding: const EdgeInsets.only(top: 35,),
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
                      const Icon(Icons.settings)
                    ]
                  ) ,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: _selectedIndex == 0
                  ? ChangeNotifierProvider(
                      create: (context) => PrematchBoard(),
                      child:PrematchBoardUI(),
                    )
                    : BoardUI(),
                ),
              ),
              BoardScreenButtons(
                onReadyPressed: () {
                  //TODO: Handle ready button
                },
                onExitPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
              Expanded(
                child: BoardScreenBottomNavBar(),
              ),
              
            ],
          ),
          ),
        ]
      ) 
    );
  }
}
