import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Text('Player One - Player Two'),
      ),
    );
  }
}
