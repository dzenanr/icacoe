import 'dart:html';

import 'package:icacoe/icacoe.dart';

main() {
  // model
  var grid = new SquareGrid(3);
  // view
  new Board(grid, querySelector('#canvas')).draw();
}


