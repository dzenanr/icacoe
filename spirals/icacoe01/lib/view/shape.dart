part of geo;

class Circle {
  num x, y, radius;
  Surface surface;

  Circle(this.surface, this.x, this.y, this.radius);

  draw() {
    surface.context
        ..arc(x, y, radius, 0, PI * 2)
        ..stroke();
  }
}

class Rectangle {
  num x, y, width, height;
  Surface surface;

  Rectangle(this.surface, this.x, this.y, this.width, this.height);

  draw() {
    surface.context
        ..rect(x, y, width, height)
        ..stroke();
  }
}

class Square extends Rectangle {
  num length;

  Square(surface, x, y, l) : length = l, super(surface, x, y, l, l);
}
