import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Game of the Generals'),
        ]
        ),
      ),
    );
  }


}