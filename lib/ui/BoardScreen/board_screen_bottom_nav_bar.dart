import 'package:flutter/material.dart';
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
    return Column(
      children: [
        const ScoreWidget(),
        Expanded(
          child: _selectedIndex == 0 ? const GraveyardWidget() : const HierarchyWidget(),
        ),
        CustomBottomNavigationBar(
          items: [
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
        );
      }).toList(),
    );
  }
}

class CustomBottomNavigationBarItem {
  final IconData icon;
  final String label;

  CustomBottomNavigationBarItem({
    required this.icon,
    required this.label,
  });
}

class HierarchyWidget extends StatelessWidget {
  const HierarchyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 38, 38, 38), 
      child: const Center(
        child: Text(
          'Hierarchy',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
