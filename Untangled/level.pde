class level {
  ArrayList<vertices> vertices = new ArrayList();
  
  level() {
    for (int i = 0; i < 10; i++) {
      vertices.add(new vertices(random(0,1280), random(0,720)));
    }
  }
  
  int getNumVertices() {
    return vertices.size();
  }
}
