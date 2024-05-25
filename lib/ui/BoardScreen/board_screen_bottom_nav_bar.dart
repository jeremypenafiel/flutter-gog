import 'package:flutter/material.dart';
import 'scoreboard_ui.dart';
import 'graveyard_ui.dart';

class BoardScreenBottomNavBar extends StatefulWidget {
  const BoardScreenBottomNavBar({Key? key}) : super(key: key);

  @override
  _BoardScreenBottomNavBarState createState() => _BoardScreenBottomNavBarState();
}

class _BoardScreenBottomNavBarState extends State<BoardScreenBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScoreWidget(),
        Expanded(
          child: _selectedIndex == 0 ? GraveyardWidget() : HierarchyWidget(),
        ),
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sick),
              label: 'Graveyard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.reduce_capacity),
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
