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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 230, 140, 5),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 228, 147, 26),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(120, 50),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  
                  onPressed: onReadyPressed,

                  child:  const Text(
                    'READY',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

        ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 212, 157, 75),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(120, 50),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  
                  onPressed: onExitPressed,
                  
                  child:  const Text(
                    'EXIT',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

      ],
    );
  }
}
