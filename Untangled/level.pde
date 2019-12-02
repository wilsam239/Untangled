class Level {
  ArrayList<Vertex> vertices = new ArrayList();
  ArrayList<Edge> edges = new ArrayList();
  Level() {
    for (int i = 0; i < 10; i++) {
      vertices.add(new Vertex(random(0,1280), random(0,720)));
      if(i % 2 != 0) {
        edges.add(new Edge(vertices.get(i), vertices.get(i-1)));
      }
    }
  }
  
  int getNumVertices() {
    return vertices.size();
  }

  public void draw() {
    
    for(int i = 0; i < edges.size(); i++) {
      edges.get(i).draw();
    }

    for(int i = 0; i < vertices.size(); i++) {
      fill(Colours.vertexFill);
      stroke(Colours.vertexStroke);
      ellipse(vertices.get(i).x(), vertices.get(i).y(), Dimen.vertexDim, Dimen.vertexDim);
    }

  }
}
