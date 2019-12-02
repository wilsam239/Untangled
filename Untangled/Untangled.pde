Level l = new Level();
void setup() {
  size(1280,720);
  background(Colours.background);
  noStroke();
}

void draw() {
  fill(Colours.vertexFill);
  stroke(Colours.vertexStroke);
  for(int i = 0; i < l.getNumVertices(); i++) {
    ellipse(l.vertices.get(i).x(), l.vertices.get(i).y(), Dimen.vertexDim, Dimen.vertexDim);
  }
}
