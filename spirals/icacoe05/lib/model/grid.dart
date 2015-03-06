part of icacoe;

class IaoGrid extends SquareGrid {
  static const String x = 'X';
  static const String o = 'O';

  IaoGrid(int size): super(size);

  bool lineCompleted() {
    var c;
    var t;
    var line = [];
    // columns
    for (var x = 0; x < size; x++) {
      line = [];
      for (var y = 0; y < size; y++) {
        c = cells.cell(x, y);
        t = c.text;
        line.add(t);
      }
      if (_completed(line)) return true;
    }
    // rows
    for (var y = 0; y < size; y++) {
      line = [];
      for (var x = 0; x < size; x++) {
        c = cells.cell(x, y);
        t = c.text;
        line.add(t);
      }
      if (_completed(line)) return true;
    }
    // diagonal: \
    line = [];
    for (var d = 0; d < size; d++) {
      c = cells.cell(d, d);
      t = c.text;
      line.add(t);
    }
    if (_completed(line)) return true;
    // diagonal: /
    line = [];
    var y = size - 1;
    for (var x = 0; x < size; x++) {
      c = cells.cell(x, y);
      t = c.text;
      line.add(t);
      y--;
    }
    if (_completed(line)) return true;
    return false;
  }

  bool _completed(List line) =>
      line.every((t) => t != null && t == x) ||
      line.every((t) => t != null && t == o);
}