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
        while (random(100) > 5 && counter < difficulty) {
            //float vertexX = random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer);
            //float vertexY = random(Dimen.vertexBuffer, Dimen.gameHeight - Dimen.vertexBuffer);

            this.vertices.add(new Vertex());

            counter++;
        }

        // Position the vertices in a circle.

        // Add edges to the vertices.
        counter = 0;

        this.makeCircle();
        this.placeEdges();
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
        // Get the number of vertices in the level.
        int vertexCount = this.vertices.size();
        // The minimum number of edges required to connect all vertices.
        int minCount = this.vertices.size() - 1;
        int counter = 0;

        while (random(100) > 5 || counter < minCount) {
            this.edges.add(new Edge(vertices.get(int(random(vertexCount))), this.vertices.get(int(random(vertexCount)))));
            
            counter++;
        }
    }

    private void attemptPlaceEdge() {

    }

}