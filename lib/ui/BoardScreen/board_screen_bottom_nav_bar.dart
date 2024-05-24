import 'package:flutter/material.dart';
import 'scoreboard_ui.dart';

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

class GraveyardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 38, 38, 38),
      child: Center(
        child: Text(
          'AWTS PATAY SILA HAHAHAHAHAHAH',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HierarchyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 38, 38, 38), 
      child: Center(
        child: Text(
          'Hierarchy',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
