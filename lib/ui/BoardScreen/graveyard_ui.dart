import 'package:flutter/material.dart';

class GraveyardWidget extends StatelessWidget {
  const GraveyardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 38, 38, 38),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: _buildGraveyardColumn(1), // Player One graveyard
          ),
          Container(
            width: 1.0,
            color: Colors.white, 
          ),
          Expanded(
            child: _buildGraveyardColumn(2), // Player Two graveyard
          ),
        ],
      ),
    );
  }

  Widget _buildGraveyardColumn(int playerNumber) {
    return ListView.builder(
      itemCount: 5, // placeholder lang pero gaincrement dapat so if wala pa deds, wala pa dapat display
      itemBuilder: (context, index) {
        return _buildGraveyardPiece(playerNumber, index);
      },
    );
  }

  Widget _buildGraveyardPiece(int playerNumber, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Text(
        'Player $playerNumber - Piece $index', // Image lang dapat ka piece and piece name
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
