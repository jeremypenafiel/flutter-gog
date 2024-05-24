import 'package:flutter/material.dart';

class BoardScreenBottomNavBar extends StatelessWidget {
  const BoardScreenBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Additional content can go here
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text('Player One 0 - 0 Player Two'),
            ),
          ),
        ),
        BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.scoreboard),
              label: 'Scoreboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sort),
              label: 'Hierarchy',
            ),
          ],
          onTap: (index) {
            // Handle the bottom navigation bar tap
            if (index == 0) {
              // Navigate to the scoreboard
            } else if (index == 1) {
              // Navigate to the hierarchy
            }
          },
        ),
      ],
    );
  }
}
