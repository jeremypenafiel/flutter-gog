import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Container( 
          child: Text('Player One - Player Two'),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 38, 38, 38),
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.white
                ),
              
            )
          ),     
        ),
      ),
    );
  }
}
