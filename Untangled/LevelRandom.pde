public class LevelRandom extends Level {

    public static final float timerStart = 30.0;
    private float timer;
    public static final float levelCompleteBonus = 5.0;

    private static final int difficultyStart = 10;
    private int difficulty;

    private boolean gameCompleted = false;

    // A simple constructor for the createing the first random level in an endless game.
    public LevelRandom(Game game) {
        this.game = game;
        this.difficulty = LevelRandom.difficultyStart;
        this.timer = LevelRandom.timerStart;

        createRandomLevel();
    }

    // Constructor for creating a secondary random level.
    public LevelRandom(Game game, int difficulty, float timer) {
        this.game = game;
        this.difficulty = difficulty;
        this.timer = timer;

        createRandomLevel();
    }

    // Generates a new random level.
    private void createRandomLevel() {

        println("TODO: Use difficulty to create random level!");

        int counter = 0;

        // Add new vertices.
        while ((random(100) > 5 && counter < this.difficulty) || counter < this.difficulty / 2) {
            
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

    // Returns this levels difficulty.
    public int getDifficulty() {
        return this.difficulty;
    }

    public float getTimer() {
        return this.timer;
    }

    // Update the level.
    public void update() {
        if (this.gameCompleted) return;

        // Update all the normal stuff.
        super.update();

        // Decrement the level timer.
        this.timer -= 1.0 / Untangled.FRAMERATE;

        if (this.timer <= 0) {
            this.gameCompleted = true;
            this.onFinish();
        }
    }

    // Called when the timer reaches zero.
    private void onFinish() {
        println("Finished Game!");
        this.game.uiHandler.endless_finished();
    }

    @Override
    protected void openEscMenu() {
        println("TODO: Make an esc menu for endless, shouldn't pause timer!");
        this.game.uiHandler.story_esc();
    }

    @Override
    protected void onSolve() {
        println("Level Finished");
        this.timer += LevelRandom.levelCompleteBonus;
        
        this.game.currentLevel = new LevelRandom(this.game, this.difficulty += 1, this.timer);
    }

    @Override
    public void draw() {
        // Draw the level as per normal.
        super.draw();

        // Draw the timer.
        fill(0);
        textFont(Resources.gentleTouch);
        textAlign(LEFT);
        textSize(Dimen.menuTextSize());
        float width = textWidth("30.000");
        text(this.timer, Dimen.currentSizeX() / 2 - width / 2, Dimen.gameAreaStart() / 2 + Dimen.menuTextSize() / 2);
    }

}