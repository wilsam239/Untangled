class UIHandler {

    public UIContainer root;

    // A reference to the entire game.
    public Game game;

    public UIHandler(Game game) {
        this.game = game;
        
        resetRoot();
    }

    public void resetRoot() {
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
                this.handler.game.currentLevel = null;
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

        UIButton story = new UIButton(0, 50, 200, 100) {
            protected void onClick() {
                println("Story was pressed!");
                this.handler.choose_level();
            }
        };
        story.handler = this;
        story.parent = this.root;
        story.text = "Story";

        this.root.children.add(story);

        UIButton casual = new UIButton(0, 100, 200, 150) {
            protected void onClick() {
                println("Casual was pressed!");
                this.handler.game.currentLevel = new Level();
            }
        };
        casual.handler = this;
        casual.parent = this.root;
        casual.text = "CASUAL";

        this.root.children.add(casual);

        UIButton endless = new UIButton(0, 150, 200, 200) {
            protected void onClick() {
                println("Endless was pressed!");
                this.handler.game.currentLevel = new Level();
            }
        };
        endless.handler = this;
        endless.parent = this.root;
        endless.text = "ENDLESS";

        this.root.children.add(endless);

        UIButton back = new UIButton(0, 250, 200, 300) {
            protected void onClick() {
                this.handler.main_menu();
            }
        };
        back.handler = this;
        back.parent = this.root;
        back.text = "BACK";
        
        this.root.children.add(back);
    }

    // ----- LEVEL SELECTION -----

    public void choose_level() {
        this.root.children.clear();
        this.resetRoot();

        UIButton back = new UIButton(25, 25, 200, 125) {
            protected void onClick() {
                this.handler.main_menu();
            }
        };
        back.handler = this;
        back.parent = this.root;
        back.text = "BACK";

        this.root.children.add(back);

        UIContainer level_one_container = new UIContainer();
        level_one_container.parent = this.root;
        level_one_container.fillParentWidth();
        level_one_container.top = 150;
        level_one_container.bottom = 350;

        this.root.children.add(level_one_container);

        UIContainer level_one_title = new UIContainer();
        level_one_title.parent = level_one_container;
        level_one_title.fillParentHeight();
        level_one_title.left = 0;
        level_one_title.right = 300;
        PImage title_one = loadImage("level_one.png");
        level_one_title.setImage(title_one);
        level_one_container.children.add(level_one_title);

        UIButton level_one_v_one_btn = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-1");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_1.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_one_v_one_btn.handler = this;
        level_one_v_one_btn.parent = level_one_container;
        level_one_v_one_btn.top = 225;
        level_one_v_one_btn.bottom = 275;
        level_one_v_one_btn.left = 375;
        level_one_v_one_btn.right = 425;
        level_one_v_one_btn.text = "1";

        level_one_container.children.add(level_one_v_one_btn);
    }

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}