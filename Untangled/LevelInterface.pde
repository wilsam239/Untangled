abstract class LevelInterface {
    public ArrayList<Vertex> vertices = new ArrayList();
    public ArrayList<Edge> edges = new ArrayList();

    public void draw() {
      
        for(int i = 0; i < edges.size(); i++) {
            edges.get(i).draw();
        }

        for(int i = 0; i < vertices.size(); i++) {
            vertices.get(i).draw();
        }

    }

    public int getNumVertices() {
        return vertices.size();
    }
}