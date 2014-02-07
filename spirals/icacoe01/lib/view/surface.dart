part of geo;

class Surface {
  num width, height; // in pixels

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  Surface(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
  }

  draw() {
    new Rectangle(this, 0, 0, width, height).draw();
  }
}