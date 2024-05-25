import 'package:flutter/material.dart';

class BoardScreenButtons extends StatelessWidget {
  final void Function() onReadyPressed;
  final void Function() onExitPressed;

  const BoardScreenButtons({
    required this.onReadyPressed,
    required this.onExitPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onReadyPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // button background color 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), 
              side: const BorderSide(color: Colors.white),
            ),
          ),
          child: const Text(
            'Ready',
            style: TextStyle(color: Colors.white), // text color 
          ),
        ),
        ElevatedButton(
          onPressed: onExitPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey, // button background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.white), 
            ),
          ),
          child: const Text(
            'Exit',
            style: TextStyle(color: Colors.white), // text color
          ),
        ),
      ],
    );
  }
}
