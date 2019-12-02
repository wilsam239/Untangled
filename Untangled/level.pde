class Level {
  ArrayList<Vertex> vertices = new ArrayList();
  
  Level() {
    for (int i = 0; i < 10; i++) {
      vertices.add(new Vertex(random(0,1280), random(0,720)));
    }
  }
  
  int getNumVertices() {
    return vertices.size();
  }
}
