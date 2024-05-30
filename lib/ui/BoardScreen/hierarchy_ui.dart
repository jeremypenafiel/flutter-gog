import 'package:flutter/material.dart';

class HierarchyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double spacing = MediaQuery.of(context).size.width * 0.02; // 2% of screen width
    double padding = 8.0;

    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 38, 38, 38),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/White Pieces/white_5star_general.png"),
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
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
                    SizedBox(width: spacing),
                    Expanded(
                      child: const Text(
                        "Cannot eliminate any piece. Losing this piece is an instant loss and making it reach the other end of the board is an instant win.",
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
      ),
    );
  }
}
