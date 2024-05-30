import 'package:flutter/material.dart';

class HierarchyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container (
        color: const Color.fromARGB(255, 38, 38, 38),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Hierarchy',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_5star_general.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_4star_general.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_3star_general.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_2star_general.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_1star_general.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_colonel.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_lt_colonel.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_major.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_captain.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_1st_lieut.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_2nd_lieut.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_sergeant.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates only the Private and the Flag.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_private.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates only the Spy.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_spy.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Eliminates any piece except the Private.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/White Pieces/white_flag.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Can not eliminate any piece. Losing this piece is instant loss and making it reach the other end of the board is instant win.",
                      style: TextStyle(color: Color.fromARGB(255, 240, 238, 238)),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}