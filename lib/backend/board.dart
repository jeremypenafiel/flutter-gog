import 'package:flutter/cupertino.dart';
import 'package:gog/backend/arbiter.dart';
import 'package:gog/backend/piece.dart';

class Board extends ChangeNotifier {
  VoidCallback setGameState;

  Board({required this.setGameState});

  void setBoard(List<int> newBoard){
    board = newBoard;
    notifyListeners();
  }

  int turn = 0;
  final int maxSquareNum = 72;
  static const int _maxFiles = 9;
  final List<int> moveOffsets = [-_maxFiles, _maxFiles, -1, 1];

  int? selectedTileIndex;
  List<int> possibleMoves = List.empty(growable: true);

  List<int> possibleTakeMoves = List.empty(growable: true);

  List<int> board = List<int>.filled(72, 0);
  List<int> tempBoard = List<int>.filled(72, 0);
  List<int> whiteGraveyard = [];
  List<int> blackGraveyard = [];


  void concealPieces() {
    tempBoard = board;

    for(int i = 0; i < board.length; i++){
      if(board[i] != Piece.none){
        board[i] = Piece.color(board[i]);
      }
    }
    print(board);
    notifyListeners();
  }

  void revealPieces(int pieceColor){
    print(board);
    this.board = this.tempBoard;
    notifyListeners();
  }

  Piece revealPiece(Piece piece){
    notifyListeners();
    return piece;
  }

  bool isValidMove(int targetSquare, int startSquare){
    int startRank = startSquare ~/ _maxFiles;
    int startFile = startSquare % _maxFiles;

    int targetRank = targetSquare ~/ _maxFiles;
    int targetFile = targetSquare % _maxFiles;

    int rankDifference = (targetRank - startRank).abs();
    int fileDifference = (targetFile - startFile).abs();

    return (rankDifference - fileDifference).abs() == 1;
  }

  void
  calculatePossibleMoves(int startSquare){
    possibleMoves = [];
    possibleTakeMoves = [];
    for(int offset in moveOffsets){
      int targetSquare = startSquare + offset;

      if(targetSquare < 0 || targetSquare >= maxSquareNum){
        continue;
      }

      if(!isValidMove(targetSquare, startSquare)) {
        continue;
      }


     if(!Piece.isColor(board[targetSquare], Piece.color(board[startSquare])) && board[targetSquare] != Piece.none){
       possibleTakeMoves.add(targetSquare);
      }
      if (board[targetSquare] == Piece.none) {
        possibleMoves.add(targetSquare);
      }
    }
    possibleTakeMoves = possibleTakeMoves;
    possibleMoves = possibleMoves;

  }

  void movePiece(int targetSquare, int startSquare){
    board[targetSquare] = board[startSquare];
    board[startSquare] = 0;
    selectedTileIndex = null;
    possibleMoves = List.empty(growable: true);
    possibleTakeMoves = List.empty(growable: true);
    setGameState();
    //concealPieces();
    // turn = (turn + 1) % 2;
    notifyListeners();
  }

  set setSelectedTileIndex(int index){
    selectedTileIndex = index;
    notifyListeners();
  }

  get getTurn{
    return turn;
  }

  get getSelectedTileIndex{
    return selectedTileIndex;
  }

  bool isPossibleMove(int index){
    return possibleMoves.contains(index);
  }

  bool isPossibleTakeMove(int index){
    return possibleTakeMoves.contains(index);
  }

  bool isSelectedTile(int index){
    return selectedTileIndex == index;
  }

  void takePiece(int targetPieceIndex, int initiatingPieceIndex) {

    board[targetPieceIndex] = Arbiter().checkMove(board[initiatingPieceIndex], board[targetPieceIndex], whiteGraveyard, blackGraveyard);
    board[initiatingPieceIndex] = 0;
    selectedTileIndex = null;
    possibleMoves = List.empty(growable: true);
    possibleTakeMoves = List.empty(growable: true);
    setGameState();
    //turn = (turn + 1) % 2;
    notifyListeners();
  }

  void onPieceSelected(int startSquare){
    setSelectedTileIndex = startSquare;
    calculatePossibleMoves(startSquare);
  }

  get getPossibleTakeMoves {
    return possibleTakeMoves;
  }

  get getPossibleMoves{
    return possibleMoves;
  }






}