import 'board_controller.dart';

class GameController {
  static final GameController _instance = GameController._internal();
  BoardController boardController = BoardController();

  GameController._internal();

  factory GameController() {
    return _instance;
  }




}