import 'dart:html';
import 'package:icacoe/icacoe.dart';
import 'view/board.dart';

main() {
  new Board(querySelector('#canvas'), new GameGrid(3)).draw();
}


