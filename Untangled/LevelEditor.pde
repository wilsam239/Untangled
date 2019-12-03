class LevelEditor extends LevelInterface {

    LevelEditor() {

    }

    void addVertex(float xPos, float yPos) {
        println("Adding a new vertex at x = " + xPos + " y = " + yPos);
        vertices.add(new Vertex(xPos, yPos));
    }

    void addEdge(int vertexIndex) {

    }

    @Override
    public void update() {
        if(Mouse.btnPressed.hasValue(Mouse.LEFT)) {
            this.addVertex(Mouse.x, Mouse.y);
        }
    }
}