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
        level_1_level_container.fillParentWidth();
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


        // --- Level 2 ---

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
                this.handler.game.currentLevel = new LevelEditor();
            }
        };
        menuContainer.addChild(levelEditBtn);
        levelEditBtn.handler = this;
        levelEditBtn.fillParentWidth();
        levelEditBtn.setHeight(50);
        levelEditBtn.alignTopTo(backBtn.bottom());
        levelEditBtn.setText("Level Editor");



    }



    // The settings menu.
    /*
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
        level_one_container.bottom = 210;

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
        level_one_v_one_btn.top = 155;
        level_one_v_one_btn.bottom = 205;
        level_one_v_one_btn.left = 355;
        level_one_v_one_btn.right = 405;
        level_one_v_one_btn.text = "1";

        level_one_container.children.add(level_one_v_one_btn);

        UIButton level_one_v_two_btn = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-2");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_2.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_one_v_two_btn.handler = this;
        level_one_v_two_btn.parent = level_one_container;
        level_one_v_two_btn.top = 155;
        level_one_v_two_btn.bottom = 205;
        level_one_v_two_btn.left = 410;
        level_one_v_two_btn.right = 460;
        level_one_v_two_btn.text = "2";

        level_one_container.children.add(level_one_v_two_btn);

        UIButton level_one_v_three_btn = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-3");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_3.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_one_v_three_btn.handler = this;
        level_one_v_three_btn.parent = level_one_container;
        level_one_v_three_btn.top = 155;
        level_one_v_three_btn.bottom = 205;
        level_one_v_three_btn.left = 465;
        level_one_v_three_btn.right = 515;
        level_one_v_three_btn.text = "3";

        level_one_container.children.add(level_one_v_three_btn);

        UIButton level_one_v_four_btn = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-4");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_4.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_one_v_four_btn.handler = this;
        level_one_v_four_btn.parent = level_one_container;
        level_one_v_four_btn.top = 155;
        level_one_v_four_btn.bottom = 205;
        level_one_v_four_btn.left = 520;
        level_one_v_four_btn.right = 570;
        level_one_v_four_btn.text = "4";

        level_one_container.children.add(level_one_v_four_btn);

        UIButton level_one_v_five_btn = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-5");
                Level level = this.handler.game.levelIO.loadLevelFromFile("levels/level_1_5.utg");
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_one_v_five_btn.handler = this;
        level_one_v_five_btn.parent = level_one_container;
        level_one_v_five_btn.top = 155;
        level_one_v_five_btn.bottom = 205;
        level_one_v_five_btn.left = 575;
        level_one_v_five_btn.right = 625;
        level_one_v_five_btn.text = "5";

        level_one_container.children.add(level_one_v_five_btn);
    }*/

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}