part of icacoe;

class Board extends Surface {
  static const String xColor = 'blue';
  static const String oColor = 'orange';

  Board(SquareGrid grid, CanvasElement canvas) : super(grid, canvas) {
    var size = canvas.width;           // in pixels
    var cellSize = size / grid.length; // in pixels
    var lastPlay = SquareGrid.o;

    for (Cell cell in grid.cells) cell.textSize  = 32;
    LabelElement winnerLabel = querySelector("#winner");

    canvas.onMouseDown.listen((MouseEvent e) {
      int row = (e.offset.y ~/ cellSize).toInt();
      int column = (e.offset.x ~/ cellSize).toInt();
      Cell cell = grid.cell(row, column);
      if (cell.text == null) {
        if (lastPlay == SquareGrid.o) {
          cell.text = SquareGrid.x;
          lastPlay = SquareGrid.x;
          cell.textColor  = xColor;
        }
        else {
          cell.text = SquareGrid.o;
          lastPlay = SquareGrid.o;
          cell.textColor  = oColor;
        }
        if (winner()) winnerLabel.text = 'winner is ${cell.text}';
      }
    });

    window.animationFrame.then(gameLoop);
  }

  bool winner() => (grid as SquareGrid).lineCompleted();

  gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }
}