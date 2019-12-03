abstract class LevelInterface {
    public ArrayList<Vertex> vertices = new ArrayList();
    public ArrayList<Edge> edges = new ArrayList();
    public int counter = 0;
    public int selectedVertex = -1;

    public void draw() {
        if(counter > 0) {
            background(255,0,0);
            counter--;
        }
        for(int i = 0; i < edges.size(); i++) {
            edges.get(i).draw();
        }

        for(int i = 0; i < vertices.size(); i++) {
            vertices.get(i).draw();
        }

    }

    public void invalidMove() {
        this.counter = 10;
    }

    public int getNumVertices() {
        return vertices.size();
    }

    public void update() {
        
    }
    
    public int getVertexAtMouse(float xPos, float yPos) {
        int vertexIndex = -1;
        for(int i = 0; i < vertices.size(); i++) {
            Vertex v = vertices.get(i);
            if (xPos > v.left()
            && xPos < v.right()
            && yPos < v.bottom()
            && yPos > v.top()) {
                println("Vertex here!");
                vertexIndex = i;
                break;
            }
        }
        return vertexIndex;
    }

    public void clearSelection() {
        for( Vertex v : vertices) {
            if(v.selected()) v.select();
        }
        this.selectedVertex = -1;
    }

    public void clearHover() {
        for( Vertex v : vertices) {
            if(v.hovered()) v.clearHover();
        }
    }
}