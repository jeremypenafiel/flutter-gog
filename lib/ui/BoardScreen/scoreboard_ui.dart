import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border( 
          top: BorderSide(color: Colors.white), 
          bottom: BorderSide(color: Colors.white),
        ),
      ),
      child: Container(
        color: Colors.grey[200],
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 38, 38, 38),
                padding: const EdgeInsets.symmetric(vertical: 8.0), 
                child: const Center(
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
      ),
    );
  }
}