class LevelEditor extends LevelInterface {

    private int edgeStartIndex;
    private int edgeEndIndex;
    LevelEditor() {
        edgeStartIndex = -1;
        edgeEndIndex = -1;
    }

    void addVertex(float xPos, float yPos) {
        println("Adding a new vertex at x = " + xPos + " y = " + yPos);
        vertices.add(new Vertex(xPos, yPos));        
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
        this.clearSelection();
        this.clearHover();
    }

    

    @Override
    public void update() {

        int mousedVertex = this.getVertexAtMouse(Mouse.x, Mouse.y);
        if(mousedVertex > -1) this.vertices.get(mousedVertex).hover();
        else this.clearHover();

        if(Mouse.btnPressed.hasValue(Mouse.LEFT)) {
            this.clearSelection();
            boolean createVertex = true;
            for(Vertex v : vertices) {
                if (Mouse.x > v.left() - Dimen.vertexDim/2
                && Mouse.x < v.right() + Dimen.vertexDim/2
                && Mouse.y < v.bottom() + Dimen.vertexDim/2
                && Mouse.y > v.top() - Dimen.vertexDim/2) {
                    println("Vertices will overlap! Not adding!");
                    createVertex = false;
                }
            }
            
            if(createVertex) {
                this.addVertex(Mouse.x, Mouse.y);
            } else {
                this.vertices.get(mousedVertex).select();
                this.selectedVertex = mousedVertex;
            }
        } else if (Mouse.buttons.hasValue(Mouse.LEFT)) {
            for(Vertex v : vertices) {
                if(v.selected()) {
                    for(Edge e : edges) {
                        if(e.connectedTo(v)) {
                            e.move(Mouse.x, Mouse.y, v);
                        }
                    }
                    v.move(Mouse.x, Mouse.y);
                    
                    break;
                }
            }
        }

        if(Mouse.btnReleased.hasValue(Mouse.LEFT)) {
            this.clearSelection();
        }
        
        if(Mouse.btnPressed.hasValue(Mouse.RIGHT)) {
            this.clearSelection();
            if(mousedVertex > -1) this.vertices.get(mousedVertex).select();
            
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