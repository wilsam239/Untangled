UIButton b;

Level l = new Level();

void setup() {
  size(1280,720);
  background(Colours.background);
  noStroke();
  fill(102);

  b = new UIButton();
}

void draw() {
    background(0);

  b.draw();

  fill(Colours.vertexFill);
  stroke(Colours.vertexStroke);
  for(int i = 0; i < l.getNumVertices(); i++) {
    ellipse(l.vertices.get(i).x(), l.vertices.get(i).y(), Dimen.vertexDim, Dimen.vertexDim);
  }

    drawDebug();
}

void drawDebug() {
    for(int i = 0; i < Mouse.buttons.size(); i++) {
        text(Mouse.buttons.get(i), 100, 100 + 10 * i);
    }
}
