import 'dart:html';
import 'package:boarding/boarding.dart';
import 'package:boarding/grid.dart';
import 'package:icacoe/icacoe.dart';

class Board extends Surface {
  static const String xColor = 'blue';
  static const String oColor = 'orange';

  bool play = true;

  Board(CanvasElement canvas, IaoGrid grid) : super(canvas, grid: grid) {
    var cellSize = canvas.width / grid.size; // in pixels
    var lastPlay = IaoGrid.o;

    for (Cell cell in grid.cells) cell.textSize  = 32;
    LabelElement winnerLabel = querySelector("#winner");

    canvas.onMouseDown.listen((MouseEvent e) {
      if (play) {
        var row = (e.offset.y ~/ cellSize).toInt();
        var column = (e.offset.x ~/ cellSize).toInt();
        Cell cell = grid.cells.cell(row, column);
        if (cell.text == null) {
          if (lastPlay == IaoGrid.o) {
            cell.text = IaoGrid.x;
            lastPlay = IaoGrid.x;
            cell.textColor  = xColor;
          }
          else {
            cell.text = IaoGrid.o;
            lastPlay = IaoGrid.o;
            cell.textColor  = oColor;
          }
          if (winner()) {
            winnerLabel.text = 'winner is ${cell.text}';
            play = false;
          }
        }
      }
    });

    window.animationFrame.then(gameLoop);
  }

  bool winner() => (grid as IaoGrid).lineCompleted();

  gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }
}