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
        while (random(100) > 25 && counter < difficulty) {
            float vertexX = random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer);
            float vertexY = random(Dimen.vertexBuffer, Dimen.gameHeight - Dimen.vertexBuffer);

            Vertex v = new Vertex(vertexX, vertexY);

            this.vertices.add(v);

            counter++;
        }

    }

}