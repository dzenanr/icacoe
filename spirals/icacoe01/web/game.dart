import 'dart:html';

import 'package:icacoe/model/plane.dart';
import 'package:icacoe/view/geo.dart';

main() {
  // model
  var grid = new Grid(3, 3);
  Cell cell12 = grid.cell(1, 2);
  assert(cell12.row == 1 && cell12.column == 2);
  for (Cell c in grid.cells) assert(c.text == null);
  // view
  var canvas = querySelector('#canvas');
  new Surface(canvas).draw();
}


