import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 38, 38, 38),
              padding: EdgeInsets.symmetric(vertical: 8.0), 
              child: Center(
                child: Text(
                  'Player One - Player Two',
                  style: TextStyle(
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
