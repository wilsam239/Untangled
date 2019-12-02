class Level {
    ArrayList<Vertex> vertices = new ArrayList();
    ArrayList<Edge> edges = new ArrayList();
    Level() {
      for (int i = 0; i < 10; i++) {
        vertices.add(new Vertex(random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer), random(Dimen.vertexBuffer,Dimen.gameHeight - Dimen.vertexBuffer)));
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
        vertices.get(i).draw();
      }

    }
}
