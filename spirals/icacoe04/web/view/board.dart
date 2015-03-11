import 'dart:html';
import 'package:boarding/boarding.dart';
import 'package:boarding/grid.dart';
import 'package:icacoe/icacoe.dart';

class Board extends Surface {
  static const String xColor = 'blue';
  static const String oColor = 'orange';

  bool play = true;

  Board(CanvasElement canvas, GameGrid grid) : super(canvas, grid: grid) {
    var size = canvas.width;         // in pixels
    var cellSize = size / grid.size; // in pixels
    var lastPlay = GameGrid.o;

    for (Cell cell in grid.cells) cell.textSize  = 32;
    LabelElement winnerLabel = querySelector("#winner");

    canvas.onMouseDown.listen((MouseEvent e) {
      if (play) {
        int row = (e.offset.y ~/ cellSize).toInt();
        int column = (e.offset.x ~/ cellSize).toInt();
        Cell cell = grid.cells.cell(row, column);
        if (cell.text == null) {
          if (lastPlay == GameGrid.o) {
            cell.text = GameGrid.x;
            lastPlay = GameGrid.x;
            cell.textColor  = xColor;
          }
          else {
            cell.text = GameGrid.o;
            lastPlay = GameGrid.o;
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

  bool winner() => (grid as GameGrid).lineCompleted();

  gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }
}