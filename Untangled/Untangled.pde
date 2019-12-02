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
    background(Colours.background);

    b.draw();
    l.draw();

    drawDebug();
}

void drawDebug() {
    for(int i = 0; i < Mouse.buttons.size(); i++) {
        text(Mouse.buttons.get(i), 100, 100 + 10 * i);
    }
}
