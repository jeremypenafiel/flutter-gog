import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:provider/provider.dart';
import 'scoreboard_ui.dart';
import 'graveyard_ui.dart';

import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:provider/provider.dart';
import 'scoreboard_ui.dart';
import 'graveyard_ui.dart';

class BoardScreenBottomNavBar extends StatefulWidget {
  const BoardScreenBottomNavBar({super.key});

  @override
  _BoardScreenBottomNavBarState createState() => _BoardScreenBottomNavBarState();
}

class _BoardScreenBottomNavBarState extends State<BoardScreenBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var gameController = Provider.of<GameController>(context, listen: false);
    var graveyardWidget = ChangeNotifierProvider.value(
      value: gameController.board,
      child: const GraveyardWidget(),
    );
    return Column(
      children: [
        ScoreWidget(),
        Expanded(
          child: _selectedIndex == 0 ? graveyardWidget : HierarchyWidget(),
        ),
        CustomBottomNavigationBar(
          items: const [
            CustomBottomNavigationBarItem(
              icon: Icons.sick,
              label: 'Graveyard',
            ),
            CustomBottomNavigationBarItem(
              icon: Icons.reduce_capacity,
              label: 'Hierarchy',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ],
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((entry) {
        int index = entry.key;
        CustomBottomNavigationBarItem item = entry.value;
        bool isSelected = index == currentIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () => onTap(index),
            child: ClipRRect(
              child: Container(
                color: isSelected ? const Color.fromARGB(255, 38, 38, 38) : Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.icon, color: Colors.white),
                    Text(
                      item.label,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CustomBottomNavigationBarItem {
  final IconData icon;
  final String label;

  const CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,
  });
}



class HierarchyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 38, 38, 38), 
        child: Center(
          child: Column(
            
            children: [
              Text(
                'Hierarchy',
                style: TextStyle(color: Colors.white),
                ),
            
            Row(children: [Image.asset("assets/White Pieces/white_5star_general.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_4star_general.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_3star_general.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_2star_general.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_1star_general.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_colonel.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_lt_colonel.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_major.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_captain.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_1st_lieut.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_2nd_lieut.png"),Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_sergeant.png"),Text("Eliminates only the Private and the Flag.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_private.png"),Text("Eliminates only the Spy.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_spy.png"),Text("Eliminates any piece except the Private.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            Row(children: [Image.asset("assets/White Pieces/white_flag.png"),Text("Can not eliminate any piece. Losing this piece is instant loss and making it reach the other end of the board is instant win.", style: TextStyle(color: const Color.fromARGB(255, 240, 238, 238)))],),
            
            ]
          ),
        ),
      ),
    );
  }
}
