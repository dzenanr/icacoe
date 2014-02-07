import 'dart:html';

import 'package:icacoe/icacoe.dart';

main() {
  // model
  var grid = new SquareGrid(3);
  var cell23 = grid.cell(1, 2);
  assert(cell23.row == 1 && cell23.column == 2);
  for (var c in grid.cells) assert(c.text == null);
  // view
  new Board(grid, querySelector('#canvas')).draw();
}


