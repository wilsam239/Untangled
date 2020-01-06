public class LevelRandom extends LevelInterface {

    // Constructor for creating a random level.
    public LevelRandom(Game game, int difficulty) {
        this.game = game;

        createRandomLevel(difficulty);
    }

    // Generates a new random level.
    private void createRandomLevel(int difficulty) {

        println("TODO: Use difficulty to create random level!");

        int counter = 0;

        // Add new vertices.
        while ((random(100) > 5 && counter < difficulty) || counter < difficulty / 2) {
            
            this.vertices.add(new Vertex());

            counter++;
        }

        // Position the vertices in a circle.

        // Add edges to the vertices.
        counter = 0;

        this.makeCircle();
        this.placeEdges();

        counter = 0;
        while (this.isSolved()) this.randomisePlacement();
    }

    // Position all the vertices into a circle.
    private void makeCircle() {
        // Get the number of vertices in the level.
        int vertexCount = this.vertices.size();
        
        // The size of the angle between vertices (in radians)
        float step = (PI * 2) / vertexCount;

        // Arbitrary distance from center to position vertices.
        int distance =  256;
        
        // For each vertex, calculate its position in the circle.
        for (int i = 0; i < vertexCount; i++) {
            float x = cos(step * i) * distance + (Dimen.gameWidth / 2);
            float y = sin(step * i) * distance + (Dimen.gameHeight / 2);

            this.vertices.get(i).move(x, y);
        }
    }

    // Places edges on to the levels vertices.
    private void placeEdges() {
        // The minimum number of edges required to connect all vertices.
        int minCount = this.vertices.size() - 1;
        int counter = 0;

        // Link each vertex to at least one other vertex.
        for (Vertex v : this.vertices) {
            Edge e = null;

            while (e == null) e = this.attemptEdgeGivenParent(v);

            this.edges.add(e);
        }

        while ( this.edges.size() < minCount || random(100) > 5) {
            
            Edge e = attemptEdge();

            if (e == null) continue;

            this.edges.add(e);
            
            counter++;
        }
    }

    // Attempt to create a new Edge
    // If the edge intersects or is a duplicate it returns false,
    // else success.
    private Edge attemptEdge() {
        // Get the number of vertices in the level.
        int vertexCount = this.vertices.size();
        // Get a random start vertex.
        Vertex parent1 = this.vertices.get(int(random(vertexCount)));
        return attemptEdgeGivenParent(parent1);
    }

    // Attempt to create a new edge with a given parent1
    private Edge attemptEdgeGivenParent(Vertex parent1) {
        // Get the number of vertices in the level.
        int vertexCount = this.vertices.size();

        Vertex parent2 = parent1;
        // Ensure the end vertex is not the same as the start vertex.
        while (parent2 == parent1) {
            parent2 = this.vertices.get(int(random(vertexCount)));
        }

        // Create the new edge.
        Edge e = new Edge(parent1, parent2);

        if (e.intersectsAny(this.edges)) return null;
        if (e.isDuplicateOfAny(this.edges)) return null;
        return e;
    }

    // Randomise the placement of each vertex.
    private void randomisePlacement() {
        for (Vertex v : this.vertices) {
            float vertexX = random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer);
            float vertexY = random(Dimen.vertexBuffer, Dimen.gameHeight - Dimen.vertexBuffer);

            v.move(vertexX, vertexY);
        }
    }

    @Override
    protected void openEscMenu() {
        this.game.currentLevel = new LevelRandom(this.game, 10);
    }

}