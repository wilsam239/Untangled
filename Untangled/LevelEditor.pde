class LevelEditor extends Level {

    private int edgeStartIndex;
    private int edgeEndIndex;

    // Constructor for loading a level from file.
    public LevelEditor(Game game, String filePath) {
        this.game = game;
        this.filePath = filePath;

        this.loadFromFile();
    }


    // Constructor for a new blank level.
    public LevelEditor(Game game) {
        this.game = game;
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
        super.update();
        if(Mouse.btnPressed.hasValue(Mouse.LEFT)) {
            boolean createVertex = true;
            for(Vertex v : vertices) {
                if (dist(Mouse.x, Mouse.y, v.x(), v.y()) < Dimen.vertexRadius * 2) {
                    println("Vertices will overlap! Not adding!");
                    createVertex = false;
                }
            }            
            if(createVertex) {
                this.addVertex(Mouse.x, Mouse.y);
                this.clearSelection();
            }
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

    @Override
    protected void openEscMenu() {
        this.game.uiHandler.level_editor_esc();
    }
}