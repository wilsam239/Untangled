
UIButton b;

level l = new level();
void setup() {
  size(1280,720);
  background(225);
  noStroke();
  fill(102);

  b = new UIButton();
}

void draw() {
  b.draw();
  for(int i = 0; i < l.getNumVertices(); i++) {
    ellipse(l.vertices.get(i).x(), l.vertices.get(i).y(), 50, 50);
  }
}
