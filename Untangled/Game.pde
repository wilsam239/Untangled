class Game {
    
    private int width, height;

    public UIHandler uiHandler;
    public Level currentLevel;
    public LevelIO levelIO;

    public Game(int width, int height) {
        this.width = width;
        this.height = height;

        this.setAvailableResolutions();

        this.levelIO = new LevelIO(this);

        this.uiHandler = new UIHandler(this);
        this.uiHandler.main_menu();
        println(Dimen.menuWidth);
    }

    private void setAvailableResolutions() {
        for (PVector p : Dimen.resolutions) {
            if (p.x < displayWidth && p.y < displayHeight) {
                println(p.x + ", " + p.y);
            }
        }
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