class LevelStory extends Level {

    protected String filePath;
    protected LevelStoryInfo info;

    LevelStory(ArrayList<Vertex> vertices, ArrayList<Edge> edges, Game game, LevelStoryInfo info) {
        this.vertices = vertices;
        this.edges = edges;
        this.game = game;
        this.info = info;
    }

    // Reload the level from the file.
    // TODO: Store an immutable version of the level so that IO only needs to be done once.
    public void reload() {
        if (this.info.filePath == null) {
            println("WARNING: Cannot call resetLevel if the level was not loaded from a file!");
            return;
        }
        // Unload the current level;
        this.game.currentLevel = null;

        this.game.currentLevel = this.game.levelIO.loadLevelStoryFromFile(this.info);
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

    public String filePath;
    public String next;

    // Level Definitions

    public static final LevelStoryInfo level_1_1 = new LevelStoryInfo("levels/level_1_1.utg", "levels/level_1_2.utg");
    public static final LevelStoryInfo level_1_2 = new LevelStoryInfo("levels/level_1_2.utg", "levels/level_1_3.utg");
    public static final LevelStoryInfo level_1_3 = new LevelStoryInfo("levels/level_1_3.utg", "levels/level_1_4.utg");
    public static final LevelStoryInfo level_1_4 = new LevelStoryInfo("levels/level_1_4.utg", "levels/level_1_5.utg");
    public static final LevelStoryInfo level_1_5 = new LevelStoryInfo("levels/level_1_5.utg", "levels/level_1_6.utg");
    public static final LevelStoryInfo level_1_6 = new LevelStoryInfo("levels/level_1_6.utg", "levels/level_1_7.utg");
    public static final LevelStoryInfo level_1_7 = new LevelStoryInfo("levels/level_1_7.utg", "levels/level_1_8.utg");
    public static final LevelStoryInfo level_1_8 = new LevelStoryInfo("levels/level_1_8.utg", "levels/level_1_9.utg");
    public static final LevelStoryInfo level_1_9 = new LevelStoryInfo("levels/level_1_9.utg", null);

    public LevelStoryInfo(String filePath, String next) {
        this.filePath = filePath;
        this.next = next;
    }

}
