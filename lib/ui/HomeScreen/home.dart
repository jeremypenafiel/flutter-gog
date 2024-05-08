import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ Text('Game of the Generals', style: TextStyle(fontSize: 50),)]),
              onTap: (){
                Navigator.pushNamed(context, '/board');
              },
            )
          ],
        ),
      ),
    );
  }


}