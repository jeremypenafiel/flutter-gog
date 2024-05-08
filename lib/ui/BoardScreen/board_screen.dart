import 'package:flutter/material.dart';
import 'package:gog/ui/BoardScreen/board_ui.dart';

import '../../backend/board.dart';

class BoardScreen extends StatelessWidget {
  final BoardUI boardUI =  const BoardUI();
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return boardUI;
  }
}