import 'dart:html';

import 'package:icacoe/icacoe.dart';

main() {
  // model
  var grid = new SquareGrid(3);
  var cell23 = grid.cell(1, 2);
  assert(cell23.row == 1 && cell23.column == 2);
  //for (Cell c in grid.cells) assert(c.text == null);
  assert(grid.cells.every((c) => c.text == null));
  // view
  new Board(grid, querySelector('#canvas')).draw();
}




