import 'package:flutter/material.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:provider/provider.dart';
import 'scoreboard_ui.dart';
import 'graveyard_ui.dart';
import 'hierarchy_ui.dart';

class BoardScreenBottomNavBar extends StatefulWidget {
  const BoardScreenBottomNavBar({super.key});

  @override
  _BoardScreenBottomNavBarState createState() => _BoardScreenBottomNavBarState();
}

class _BoardScreenBottomNavBarState extends State<BoardScreenBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var gameController = Provider.of<GameController>(context, listen: false);
    var graveyardWidget = ChangeNotifierProvider.value(
      value: gameController.board,
      child: const GraveyardWidget(),
    );

    return InkWell(
      child: ScoreWidget(),
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return BottomDrawerContent(
              graveyardWidget: graveyardWidget,
            );
          },
        );
      },
    );
  }
}

class BottomDrawerContent extends StatefulWidget {
  final Widget graveyardWidget;

  const BottomDrawerContent({required this.graveyardWidget, super.key});

  @override
  _BottomDrawerContentState createState() => _BottomDrawerContentState();
}

class _BottomDrawerContentState extends State<BottomDrawerContent> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400, // Adjust height as needed
      child: Column(
        children: [
          Expanded(
            child: _selectedIndex == 0 ? widget.graveyardWidget : const HierarchyWidget(),
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
      ),
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
                color: isSelected ? Colors.black : const Color.fromARGB(255, 38, 38, 38),
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
