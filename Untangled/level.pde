class Level extends LevelInterface {
    // Random Level Constructor
    Level(Game game) {
        this.game = game;
        // If no parameters, generate a new blank level
        for (int i = 0; i < 10; i++) {
            vertices.add(new Vertex(random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer), random(Dimen.vertexBuffer,Dimen.gameHeight - Dimen.vertexBuffer)));
            if(i % 2 != 0) {
                edges.add(new Edge(vertices.get(i), vertices.get(i-1)));
            }
        }
    }

    // ----- Loaded Levels -----

    protected String filePath;

    Level(ArrayList<Vertex> vertices, ArrayList<Edge> edges, Game game, String filePath) {
        this.vertices = vertices;
        this.edges = edges;
        this.game = game;
        this.filePath = filePath;
    }

    // Reload the level from the file.
    // TODO: Store an immutable version of the level so that IO only needs to be done once.
    public void reset() {
        if (this.filePath == null) {
            println("WARNING: Cannot call resetLevel if the level was not loaded from a file!");
            return;
        }
        // Unload the current level;
        this.game.currentLevel = null;

        this.game.currentLevel = this.game.levelIO.loadLevelFromFile(this.filePath);
    }
    
    public void update() {
        super.update();
        if (Mouse.btnReleased.hasValue(Mouse.LEFT)) checkIfSolved();
    }

    @Override
    protected void openEscMenu() {
        this.game.uiHandler.story_esc();
    } 
}
