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
          child: Text('Ready'),
        ),
        ElevatedButton(
          onPressed: onExitPressed,
          child: Text('Exit'),
        ),
      ],
    );
  }
}
