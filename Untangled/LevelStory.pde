class LevelStory extends Level {

    LevelStory(ArrayList<Vertex> vertices, ArrayList<Edge> edges, Game game, String filePath) {
        this.vertices = vertices;
        this.edges = edges;
        this.game = game;
        this.filePath = filePath;
    }

    private int id;

    LevelStory(Game game, int id) {
        this.game = game;
        this.id = id;

        this.filePath = LevelStoryInfo.getFilePath(id);
        if (this.filePath == null) {
            println("CRITICAL: Invalid Level ID!");
        } else {
            this.loadFromFile();
        }
    }

    // Return this levels ID.
    public int getID() {
        return this.id;
    }

    // Reload the level from the file.
    // TODO: Store an immutable version of the level so that IO only needs to be done once.
    public void reload() {
        if (this.filePath == null) {
            println("WARNING: Cannot call resetLevel if the level was not loaded from a file!");
            return;
        }
        // Unload the current level;
        this.game.currentLevel = null;

        this.game.currentLevel = new LevelStory(this.game, this.id);
    }
    
    public void update() {
        super.update();
    }

    @Override
    protected void openEscMenu() {
        this.game.uiHandler.story_esc();
    }

    @Override
    protected void onSolve() {
        println("Level Solved!");

        this.game.uiHandler.story_solved();
    } 
}

public static class LevelStoryInfo {

    // Level Definitions

    public static final String[] filePaths = {
        "levels/level_1_1.utg",
        "levels/level_1_2.utg",
        "levels/level_1_3.utg",
        "levels/level_1_4.utg",
        "levels/level_1_5.utg",
        "levels/level_1_6.utg",
        "levels/level_1_7.utg",
        "levels/level_1_8.utg",
        "levels/level_1_9.utg"
    };

    public static String getFilePath(int id) {
        return LevelStoryInfo.filePaths[id - 1];
    }

}
