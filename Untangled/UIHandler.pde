class UIHandler {

    public UIContainer root;

    // A reference to the entire game.
    public Game game;

    public UIHandler(Game game) {
        this.game = game;
        
        resetRoot();
    }

    private void resetRoot() {
        // Set the root to be the entire size of the screen.
        this.root = new UIContainer();
        this.root.top = 0;
        this.root.bottom = game.height;
        this.root.left = 0;
        this.root.right = game.width;
    }

    // The games main menu.
    public void main_menu() {
        this.root.children.clear();
        this.resetRoot();
        this.game.currentLevel = null;

        // Menu Container
        UIContainer menuContainer = new UIContainer();
        menuContainer.parent = this.root;
        menuContainer.fillParentHeight();
        menuContainer.alignLeftToLeftOf(this.root);
        menuContainer.right = 200;

        this.root.children.add(menuContainer);
        
        // Start Game Button
        UIButton startGame = new UIButton(50, 50, 200, 100) {
            protected void onClick() {
                println("Start Game was pressed!");
                this.handler.choose_mode();
            }
        };
        startGame.handler = this;
        startGame.parent = menuContainer;
        startGame.fillParentWidth();
        startGame.text = "START GAME";
        
        menuContainer.children.add(startGame);

        // Settings Button
        UIButton settings = new UIButton(50, 100, 200, 150) {
            protected void onClick() {
                println("Settings was pressed!");
                this.handler.settings_menu();
            }
        };
        settings.handler = this;
        settings.parent = menuContainer;
        settings.fillParentWidth();
        settings.text = "SETTINGS";

        menuContainer.children.add(settings);

        // Title Container
        PImage b_image = loadImage("title.png");

        UIContainer titleContainer = new UIContainer();
        titleContainer.parent = this.root;
        titleContainer.alignLeftToRightOf(menuContainer);
        titleContainer.alignRightToRightOf(this.root);
        titleContainer.alignTopToTopOf(this.root);
        titleContainer.setImage(b_image);
        titleContainer.fitHeightToImage();

        this.root.children.add(titleContainer);
    }

    // The settings menu.
    public void settings_menu() {
        this.root.children.clear();
        this.resetRoot();

        UIButton levelEdit = new UIButton(0, 50, 200, 100) {
            protected void onClick() {
                println("Level Editor was pressed!");
                this.handler.game.currentLevel = new LevelEditor();
                this.handler.level_editor();
            }
        };
        levelEdit.handler = this;
        levelEdit.parent = this.root;
        levelEdit.text = "LEVEL EDITOR";
        
        this.root.children.add(levelEdit);

        UIButton back = new UIButton(50, 200, 200, 250) {
            protected void onClick() {
                this.handler.main_menu();
            }
        };
        back.handler = this;
        back.parent = this.root;
        back.text = "BACK";
        
        this.root.children.add(back);
    }

    public void level_editor() {
        this.root.children.clear();
        this.resetRoot();

        UIButton saveToFile = new UIButton(50, 50, 200, 100) {
            protected void onClick() {
                this.handler.game.levelIO.saveLevelToFile(this.handler.game.currentLevel);
                this.handler.settings_menu();
            }
        };
        saveToFile.handler = this;
        saveToFile.parent = this.root;
        saveToFile.text = "Save to file";
        
        this.root.children.add(saveToFile);

        UIButton back = new UIButton(50, 150, 200, 200) {
            protected void onClick() {
                this.handler.game.currentLevel = null;
                this.handler.settings_menu();
            }
        };
        back.handler = this;
        back.parent = this.root;
        back.text = "BACK";
        
        this.root.children.add(back);
    }

    public void choose_mode() {
        this.root.children.clear();
        this.resetRoot();

        UIButton casual = new UIButton(50, 50, 200, 100) {
            protected void onClick() {
                println("Casual was pressed!");
                this.handler.game.currentLevel = new Level();
            }
        };
        casual.handler = this;
        casual.parent = this.root;
        casual.text = "CASUAL";

        this.root.children.add(casual);

        UIButton endless = new UIButton(50, 100, 200, 150) {
            protected void onClick() {
                println("Endless was pressed!");
                this.handler.game.currentLevel = new Level();
            }
        };
        endless.handler = this;
        endless.parent = this.root;
        endless.text = "ENDLESS";

        this.root.children.add(endless);

        UIButton back = new UIButton(50, 150, 200, 200) {
            protected void onClick() {
                this.handler.main_menu();
            }
        };
        back.handler = this;
        back.parent = this.root;
        back.text = "BACK";
        
        this.root.children.add(back);
    }

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}