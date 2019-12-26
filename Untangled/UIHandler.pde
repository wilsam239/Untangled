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
        root.setLocationAndSize(0, 0, this.game.width, this.game.height);
    }

    // The games main menu.
    public void main_menu() {
        this.resetRoot();

        // Title Image Container
        PImage titleImage = loadImage("UntangledLogoPortrait_360.png");

        UIContainer titleContainer = new UIContainer();
        this.root.addChild(titleContainer);
        titleContainer.setImage(titleImage);
        titleContainer.fitToImage();
        titleContainer.alignTop();
        titleContainer.alignCenterX();
 

        // Menu Container
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.setTop(titleContainer.bottom());
        menuContainer.setBottom(this.root.bottom());
        menuContainer.setWidth(500);
        menuContainer.alignCenterX();
        
        // Story Game Button
        UIButton startStory = new UIButton() {
            protected void onClick() {
                println("Story Game was pressed!");
                this.handler.story_menu();
            }
        };
        menuContainer.addChild(startStory);
        startStory.handler = this;
        startStory.fillParentWidth();
        startStory.setHeight(50);
        startStory.alignTop();
        startStory.setText("Story");

        // Endless Game Button
        UIButton startEndless = new UIButton() {
            protected void onClick() {
                println("Endless Game was pressed!");
                //this.handler.story_menu();
            }
        };
        menuContainer.addChild(startEndless);
        startEndless.handler = this;
        startEndless.fillParentWidth();
        startEndless.setHeight(50);
        startEndless.alignTopTo(startStory.bottom());
        startEndless.setText("Endless");

        // Settings Button
        UIButton settings = new UIButton() {
            protected void onClick() {
                println("Settings was pressed!");
                this.handler.settings_menu();
            }
        };
        menuContainer.addChild(settings);
        settings.handler = this;
        settings.fillParentWidth();
        settings.setHeight(50);
        settings.alignTopTo(startEndless.bottom());
        settings.setText("Settings");
    }

    public void story_menu() {
        this.resetRoot();

        UIContainer menuContainer =  new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.fillParentHeight();
        menuContainer.setWidth(500);
        menuContainer.alignCenterX();

        // Title
        UIContainer storyTitle = new UIContainer();
        menuContainer.addChild(storyTitle);
        storyTitle.setHeight(100);
        storyTitle.fillParentWidth();
        storyTitle.alignTop();
        storyTitle.setText("Story");
        storyTitle.setTextSize(Dimen.headingTextSize);

        // --- Level 1 ---
        UIContainer level_1_container = new UIContainer();
        this.root.addChild(level_1_container);
        level_1_container.fillParentWidth();
        level_1_container.setHeight(100);
        level_1_container.alignTopTo(storyTitle.bottom());
        level_1_container.setFill(new Colour(55, 55, 128, 32));
        

        UIContainer level_1_title = new UIContainer();
        level_1_container.addChild(level_1_title);
        level_1_title.fillParentWidth();
        level_1_title.setHeight(40);
        level_1_title.alignTop();
        level_1_title.setText("Level 1");
        level_1_title.setTextSize(32);
        
        UIContainer level_1_level_container = new UIContainer();
        level_1_container.addChild(level_1_level_container);
        level_1_level_container.setHeight(60);
        level_1_level_container.alignBottom();

        // -- Level 1-1 --
        UIButton level_1_1 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-1");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_1.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_1);
        level_1_1.handler = this;
        level_1_1.setWidth(50);
        level_1_1.setHeight(50);
        level_1_1.alignCenterY();
        level_1_1.alignLeftTo(level_1_level_container.left() + 5);
        level_1_1.setText("1");

        // -- Level 1-2 --
        UIButton level_1_2 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-2");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_2.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_2);
        level_1_2.handler = this;
        level_1_2.setWidth(50);
        level_1_2.setHeight(50);
        level_1_2.alignCenterY();
        level_1_2.alignLeftTo(level_1_1.right() + 5);
        level_1_2.setText("2");


        // -- Level 1-3 --
        UIButton level_1_3 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-3");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_3.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_3);
        level_1_3.handler = this;
        level_1_3.setWidth(50);
        level_1_3.setHeight(50);
        level_1_3.alignCenterY();
        level_1_3.alignLeftTo(level_1_2.right() + 5);
        level_1_3.setText("3");

        // -- Level 1-4 --
        UIButton level_1_4 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-4");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_4.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_4);
        level_1_4.handler = this;
        level_1_4.setWidth(50);
        level_1_4.setHeight(50);
        level_1_4.alignCenterY();
        level_1_4.alignLeftTo(level_1_3.right() + 5);
        level_1_4.setText("4");

        // -- Level 1-5 --
        UIButton level_1_5 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-5");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_5.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_5);
        level_1_5.handler = this;
        level_1_5.setWidth(50);
        level_1_5.setHeight(50);
        level_1_5.alignCenterY();
        level_1_5.alignLeftTo(level_1_4.right() + 5);
        level_1_5.setText("5");

        // -- Level 1-6 --
        UIButton level_1_6 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-6");
                //Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_5.utg");
                //this.handler.game.currentLevel = level;
                //this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_6);
        level_1_6.handler = this;
        level_1_6.setWidth(50);
        level_1_6.setHeight(50);
        level_1_6.alignCenterY();
        level_1_6.alignLeftTo(level_1_5.right() + 5);
        level_1_6.setText("6");

        // -- Level 1-7 --
        UIButton level_1_7 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-7");
                //Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_5.utg");
                //this.handler.game.currentLevel = level;
                //this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_7);
        level_1_7.handler = this;
        level_1_7.setWidth(50);
        level_1_7.setHeight(50);
        level_1_7.alignCenterY();
        level_1_7.alignLeftTo(level_1_6.right() + 5);
        level_1_7.setText("7");

        // -- Level 1-8 --
        UIButton level_1_8 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-8");
                //Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_8.utg");
                //this.handler.game.currentLevel = level;
                //this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_8);
        level_1_8.handler = this;
        level_1_8.setWidth(50);
        level_1_8.setHeight(50);
        level_1_8.alignCenterY();
        level_1_8.alignLeftTo(level_1_7.right() + 5);
        level_1_8.setText("8");

        // -- Level 1-9 --
        UIButton level_1_9 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-9");
                //Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_9.utg");
                //this.handler.game.currentLevel = level;
                //this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_9);
        level_1_9.handler = this;
        level_1_9.setWidth(50);
        level_1_9.setHeight(50);
        level_1_9.alignCenterY();
        level_1_9.alignLeftTo(level_1_8.right() + 5);
        level_1_9.setText("9");

        level_1_level_container.fitToChildrenX();
        level_1_level_container.alignCenterWithChildrenX();
        level_1_level_container.setFill(new Colour(255, 0, 255));


        // --- Level 2 ---

    }

    public void level_completed() {
        this.resetRoot();

        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.fillParentHeight();
        menuContainer.setWidth(menuContainer.height());
        menuContainer.alignCenterX();
        menuContainer.setFill(new Colour(128, 128, 182, 128));

        UIButton backToMenu = new UIButton() {
            protected void onClick() {
                this.handler.main_menu();
                this.handler.game.currentLevel = null;
            }
        };
        menuContainer.addChild(backToMenu);
        backToMenu.handler = this;
        backToMenu.setHeight(100);
        backToMenu.fillParentWidth();
        backToMenu.alignBottom();
        backToMenu.setText("Return To Menu");
        backToMenu.setTextSize(32);

    }

    public void settings_menu() {
        this.resetRoot();

        // Menu Container
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.fillParentHeight();
        menuContainer.setWidth(500);
        menuContainer.alignCenterX();

        // The Settings title
        UIContainer settingsTitle = new UIContainer();
        menuContainer.addChild(settingsTitle);
        settingsTitle.setHeight(100);
        settingsTitle.fillParentWidth();
        settingsTitle.alignTop();
        settingsTitle.setText("Settings");
        settingsTitle.setTextSize(Dimen.headingTextSize);

        UIButton backBtn = new UIButton() {
            protected void onClick() {
                println("Back!");
                this.handler.main_menu();
            }
        };
        menuContainer.addChild(backBtn);
        backBtn.handler = this;
        backBtn.fillParentWidth();
        backBtn.setHeight(50);
        backBtn.alignTopTo(settingsTitle.bottom());
        backBtn.setText("Back");

        UIButton levelEditBtn = new UIButton() {
            protected void onClick() {
                println("Level Editor!");
                this.handler.game.currentLevel = new LevelEditor(this.handler.game);
                this.handler.level_editor();
            }
        };
        menuContainer.addChild(levelEditBtn);
        levelEditBtn.handler = this;
        levelEditBtn.fillParentWidth();
        levelEditBtn.setHeight(50);
        levelEditBtn.alignTopTo(backBtn.bottom());
        levelEditBtn.setText("Level Editor");

        UITextInput testInput = new UITextInput() {
            protected void onSubmit() {
                println("Submitted: " + this.getInput());
            }
        };
        menuContainer.addChild(testInput);
        testInput.handler = this;
        testInput.fillParentWidth();
        testInput.setHeight(50);
        testInput.alignTopTo(levelEditBtn.bottom());
    }

    public void level_editor() {
        this.resetRoot();
        UIContainer hint = new UIContainer();
        this.root.addChild(hint);
        hint.setHeight(50);
        hint.setWidth(100);
        hint.alignBottom();
        hint.alignRight();
        hint.setText("Press 'esc' to open menu");
    }

    public void level_editor_esc() {
        this.resetRoot();
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.fillParentHeight();
        menuContainer.setWidth(500);
        menuContainer.alignCenterX();

        UIButton exit = new UIButton() {
            protected void onClick() {
                this.handler.game.currentLevel = null;
                this.handler.settings_menu();
            }
        };
        menuContainer.addChild(exit);
        exit.handler = this;
        exit.fillParentWidth();
        exit.setHeight(50);
        exit.alignCenter();
        exit.setText("Exit");
    }

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}