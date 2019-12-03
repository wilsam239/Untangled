class Game {
    
    private int width, height;

    public UIHandler uiHandler;
    public LevelInterface currentLevel;

    public Game(int width, int height) {
        this.width = width;
        this.height = height;

        this.uiHandler = new UIHandler(this);
        this.uiHandler.main_menu();
    }

    public void run() {
        update();
        draw();
    }

    private void update() {
        this.uiHandler.update();
        if (this.currentLevel != null) this.currentLevel.update();
    }

    private void draw() {
        if (this.currentLevel != null) this.currentLevel.draw();
        this.uiHandler.draw();
    }

}