class LevelEditor extends LevelInterface {

    private int edgeStartIndex;
    private int edgeEndIndex;
    LevelEditor() {
        edgeStartIndex = -1;
        edgeEndIndex = -1;
    }

    void addVertex(float xPos, float yPos) {
        boolean createVertex = true;
        for(Vertex v : vertices) {
            if (xPos > v.left() - Dimen.vertexDim/2
            && xPos < v.right() + Dimen.vertexDim/2
            && yPos < v.bottom() + Dimen.vertexDim/2
            && yPos > v.top() - Dimen.vertexDim/2) {
                println("Vertices will overlap! Not adding!");
                createVertex = false;
                this.invalidMove();
            }
        }
        
        if(createVertex) {
            println("Adding a new vertex at x = " + xPos + " y = " + yPos);
            vertices.add(new Vertex(xPos, yPos));
        }
        
    }

    void addEdge(int vertexIndexStart, int vertexIndexEnd) {
        Vertex start = this.vertices.get(vertexIndexStart);
        Vertex end = this.vertices.get(vertexIndexEnd);

        boolean createEdge = true;
        for(Edge e : edges) {
            if(e.startVertex == start && e.endVertex == end) {
                createEdge = false;
                break;
            }
        }
        if(createEdge) {
            this.edges.add(new Edge(start, end));
            println("Added an Edge from vertex " + vertexIndexStart + " to " + vertexIndexEnd);
        } else {
            println("Not creating an edge there! There must already be one there!");
            this.invalidMove();
        }
        
        this.resetEdges();
    }

    void resetEdges() {
        this.edgeStartIndex = -1;
        this.edgeEndIndex = -1;
    }

    

    @Override
    public void update() {
        if(Mouse.btnPressed.hasValue(Mouse.LEFT)) {
            this.addVertex(Mouse.x, Mouse.y);
        }
        if(Mouse.btnPressed.hasValue(Mouse.RIGHT)) {
            if(edgeStartIndex == -1) {
                edgeStartIndex = this.getVertexAtMouse(Mouse.x, Mouse.y);
            } else if(edgeStartIndex > -1 && edgeEndIndex == -1) {
                edgeEndIndex = this.getVertexAtMouse(Mouse.x, Mouse.y);
                if(edgeEndIndex == edgeStartIndex) {
                    edgeEndIndex = -1;
                    this.invalidMove();
                }
            } 
            
            if(edgeEndIndex > -1 && edgeStartIndex > -1) {
                this.addEdge(edgeStartIndex, edgeEndIndex);
            }
        }
    }
}