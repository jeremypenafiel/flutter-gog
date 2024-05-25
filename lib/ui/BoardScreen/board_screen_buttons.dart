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
            backgroundColor: Colors.orange, // Set button background color to orange
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Set border radius
              side: const BorderSide(color: Colors.white), // Set border color
            ),
          ),
          child: const Text(
            'Ready',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
        ElevatedButton(
          onPressed: onExitPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey, // Set button background color to grey
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Set border radius
              side: const BorderSide(color: Colors.white), // Set border color
            ),
          ),
          child: const Text(
            'Exit',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
      ],
    );
  }
}
