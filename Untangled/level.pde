abstract class Level {
    public ArrayList<Vertex> vertices = new ArrayList();
    public ArrayList<Edge> edges = new ArrayList();
    public int counter = 0;
    public int selectedVertex = -1;
    public int mousedVertex = -1;
    private int movesMade = 0;
    public Vertex vertexMoving;
    protected Game game;

    private boolean solved = false;

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

        // Draw the levels bounds.
        stroke(Colours.thundercloud.R, Colours.thundercloud.G, Colours.thundercloud.B);
        fill(Colours.crossbones.R, Colours.crossbones.G, Colours.crossbones.B, Colours.crossbones.A);
        rect(Dimen.gameAreaStart, Dimen.gameAreaStart, Dimen.gameWidth - 2 * Dimen.gameAreaStart, Dimen.gameHeight - 2 * Dimen.gameAreaStart);
    }

    public void invalidMove() {
        this.counter = 10;
    }

    public int getNumVertices() {
        return vertices.size();
    }

    public void update() {
        // Check for 'esc' keypress
        if (Keyboard.keyPressed.hasValue(Keyboard.ESCAPE)) this.openEscMenu();

        this.mousedVertex = this.getVertexAtMouse(Mouse.x, Mouse.y);
        if(this.mousedVertex > -1) this.vertices.get(mousedVertex).hover();
        else this.clearHover();

        if(Mouse.btnPressed.hasValue(Mouse.LEFT)) {
            this.clearSelection();
            if(this.mousedVertex > -1) {
                this.vertices.get(this.mousedVertex).select();
                this.selectedVertex = this.mousedVertex;
                if(this.selectedVertex > -1) {
                    this.vertexMoving = new Vertex(this.vertices.get(this.selectedVertex));
                    println("The vertex to check has been set.");
                }
            }
        } else if (Mouse.buttons.hasValue(Mouse.LEFT)) {            
            this.moveVertex();
        }

        if(Mouse.btnReleased.hasValue(Mouse.LEFT)) {
            if(this.selectedVertex > -1) {
                if(!this.vertexMoving.compare(this.vertices.get(this.selectedVertex))) {
                    movesMade++;
                    println("Move Count: ", movesMade);
                    this.vertexMoving = null;
                }

                // If the level has just been solved call onSolve().
                if (this.isSolved() && !this.solved) {
                    this.solved = true;
                    this.onSolve();
                }
            }           
            this.clearSelection();
        }


        // Edge Intersection
        for (Edge e1 : this.edges) {
            e1.setIntersecting(this.checkEdgeForIntersection(e1));
        }

    }
    
    // Open the escape menu for the level.
    protected void openEscMenu() {
        println("WARNING: LevelInterface.openEscMenu() should be overriden!");
    }

    public int getVertexAtMouse(float xPos, float yPos) {
        int vertexIndex = -1;
        for(int i = 0; i < vertices.size(); i++) {
            Vertex v = vertices.get(i);
            if (dist(xPos, yPos, v.x(), v.y()) < Dimen.vertexRadius) {
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

    public void moveVertex() {
        for(Vertex v : vertices) {
            if(v.selected()) {
                v.move(Mouse.x, Mouse.y);             
                break;
            }
        }
    }

    // Check to see if the given line intersects with any other lines.
    private boolean checkEdgeForIntersection(Edge e1) {
        for (Edge e2 : this.edges) {
            if (e1 == e2) continue;
            if (e1.startVertex == e2.startVertex
            || e1.startVertex == e2.endVertex
            || e1.endVertex == e2.startVertex
            || e1.endVertex == e2.endVertex) continue;
            if (checkIntersection(e1, e2)) return true;
        }
        return false;
    }

    private boolean checkIntersection(Edge e1, Edge e2) {

        float x1 = e1.getStart().x();
        float x2 = e1.getEnd().x();
        float x3 = e2.getStart().x();
        float x4 = e2.getEnd().x();

        float y1 = e1.getStart().y();
        float y2 = e1.getEnd().y();
        float y3 = e2.getStart().y();
        float y4 = e2.getEnd().y();

        float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

        float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

        if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
            float intersectionX = x1 + (uA * (x2-x1));
            float intersectionY = y1 + (uA * (y2-y1));

            return true;
        } else {
            return false;
        }
    }

    // Returns true if there are no collisions in the level.
    protected boolean isSolved() {
        for(Edge e: edges) {
            if(checkEdgeForIntersection(e)) {
                return false;
            }
        }
        return true;
    }

    // Called a single time when the level is first solved.
    protected void onSolve() {
        println("WARNING: LevelInterface.onSolve() should be overriden!");
    }

    public void checkIfSolved() {
        for(Edge e: edges) {
            if(checkEdgeForIntersection(e)) {
                return;
            }
        }
        this.game.uiHandler.level_completed();
    }
}