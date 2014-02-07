import 'dart:html';
import 'package:icacoe/icacoe.dart';

main() {
  new Board(new SquareGrid(3), querySelector('#canvas')).draw();
}


