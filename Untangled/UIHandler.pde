public class UIHandler {

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
        root.setLocationAndSize(0, 0, Dimen.currentSizeX(), Dimen.currentSizeY());
    }

    // The games main menu.
    public void main_menu() {
        this.resetRoot();

        // Title Image Container
        PImage titleImage = loadImage(Resources.currentLogo());

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
        menuContainer.setWidth(Dimen.menuWidth());
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
        startStory.setHeight(Dimen.menuHeight());
        startStory.alignTop();
        startStory.setText("Story");
        startStory.setTextSize(Dimen.menuTextSize());

        // Endless Game Button
        UIButton startEndless = new UIButton() {
            protected void onClick() {
                println("Endless Game was pressed!");
                this.handler.resetRoot();
                this.handler.game.currentLevel = new LevelRandom(this.handler.game);
            }
        };
        menuContainer.addChild(startEndless);
        startEndless.handler = this;
        startEndless.fillParentWidth();
        startEndless.setHeight(Dimen.menuHeight());
        startEndless.alignTopTo(startStory.bottom());
        startEndless.setText("Endless");
        startEndless.setTextSize(Dimen.menuTextSize());


        UIButton startEditor = new UIButton() {
            protected void onClick() {
                println("Level Editor!");
                this.handler.level_editor_select();
            }
        };
        menuContainer.addChild(startEditor);
        startEditor.handler = this;
        startEditor.fillParentWidth();
        startEditor.setHeight(Dimen.menuHeight());
        startEditor.alignTopTo(startEndless.bottom());
        startEditor.setText("Level Editor");
        startEditor.setTextSize(Dimen.menuTextSize());

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
        settings.setHeight(Dimen.menuHeight());
        settings.alignTopTo(startEditor.bottom());
        settings.setText("Settings");
        settings.setTextSize(Dimen.menuTextSize());
        
        // Settings Button
        UIButton exit = new UIButton() {
            protected void onClick() {
                println("Exit!");
                exit();
            }
        };
        menuContainer.addChild(exit);
        exit.handler = this;
        exit.fillParentWidth();
        exit.setHeight(Dimen.menuHeight());
        exit.alignBottom();
        exit.setText("Exit");
        exit.setTextSize(Dimen.menuTextSize());
    }

    public void story_menu() {
        this.resetRoot();

        UIContainer menuContainer =  new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.fillParentHeight();
        menuContainer.setWidth(Dimen.menuWidth());
        menuContainer.alignCenterX();

        // Title
        UIContainer storyTitle = new UIContainer();
        menuContainer.addChild(storyTitle);
        storyTitle.setHeight(Dimen.menuHeight() * 2);
        storyTitle.fillParentWidth();
        storyTitle.alignTop();
        storyTitle.setText("Story");
        storyTitle.setTextSize(Dimen.headingTextSize());

        // --- Level 1 ---
        UIContainer level_1_container = new UIContainer();
        this.root.addChild(level_1_container);
        level_1_container.fillParentWidth();
        level_1_container.setHeight(Dimen.menuHeight() * 2);
        level_1_container.alignTopTo(storyTitle.bottom());
        level_1_container.setFill(new Colour(55, 55, 128, 32));
        

        UIContainer level_1_title = new UIContainer();
        level_1_container.addChild(level_1_title);
        level_1_title.fillParentWidth();
        level_1_title.setHeight(Dimen.menuHeight());
        level_1_title.alignTop();
        level_1_title.setText("Level 1");
        level_1_title.setTextSize(Dimen.menuTextSize());
        
        UIContainer level_1_level_container = new UIContainer();
        level_1_container.addChild(level_1_level_container);
        level_1_level_container.setHeight(Dimen.menuHeight());
        level_1_level_container.alignBottom();

        // -- Level 1-1 --
        UIButton level_1_1 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-1");
                LevelStory level = new LevelStory(this.handler.game, 1);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_1);
        level_1_1.handler = this;
        level_1_1.setWidth(Dimen.menuHeight());
        level_1_1.setHeight(Dimen.menuHeight());
        level_1_1.alignCenterY();
        level_1_1.alignLeftTo(level_1_level_container.left() + Dimen.storyMenuPadding());
        level_1_1.setText("1");

        // -- Level 1-2 --
        UIButton level_1_2 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-2");
                LevelStory level = new LevelStory(this.handler.game, 2);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_2);
        level_1_2.handler = this;
        level_1_2.setWidth(Dimen.menuHeight());
        level_1_2.setHeight(Dimen.menuHeight());
        level_1_2.alignCenterY();
        level_1_2.alignLeftTo(level_1_1.right() + Dimen.storyMenuPadding());
        level_1_2.setText("2");


        // -- Level 1-3 --
        UIButton level_1_3 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-3");
                LevelStory level = new LevelStory(this.handler.game, 3);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_3);
        level_1_3.handler = this;
        level_1_3.setWidth(Dimen.menuHeight());
        level_1_3.setHeight(Dimen.menuHeight());
        level_1_3.alignCenterY();
        level_1_3.alignLeftTo(level_1_2.right() + Dimen.storyMenuPadding());
        level_1_3.setText("3");

        // -- Level 1-4 --
        UIButton level_1_4 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-4");
                LevelStory level = new LevelStory(this.handler.game, 4);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_4);
        level_1_4.handler = this;
        level_1_4.setWidth(Dimen.menuHeight());
        level_1_4.setHeight(Dimen.menuHeight());
        level_1_4.alignCenterY();
        level_1_4.alignLeftTo(level_1_3.right() + Dimen.storyMenuPadding());
        level_1_4.setText("4");

        // -- Level 1-5 --
        UIButton level_1_5 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-5");
                LevelStory level = new LevelStory(this.handler.game, 5);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_5);
        level_1_5.handler = this;
        level_1_5.setWidth(Dimen.menuHeight());
        level_1_5.setHeight(Dimen.menuHeight());
        level_1_5.alignCenterY();
        level_1_5.alignLeftTo(level_1_4.right() + Dimen.storyMenuPadding());
        level_1_5.setText("5");

        // -- Level 1-6 --
        UIButton level_1_6 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-6");
                LevelStory level = new LevelStory(this.handler.game, 6);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_6);
        level_1_6.handler = this;
        level_1_6.setWidth(Dimen.menuHeight());
        level_1_6.setHeight(Dimen.menuHeight());
        level_1_6.alignCenterY();
        level_1_6.alignLeftTo(level_1_5.right() + Dimen.storyMenuPadding());
        level_1_6.setText("6");

        // -- Level 1-7 --
        UIButton level_1_7 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-7");
                LevelStory level = new LevelStory(this.handler.game, 7);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_7);
        level_1_7.handler = this;
        level_1_7.setWidth(Dimen.menuHeight());
        level_1_7.setHeight(Dimen.menuHeight());
        level_1_7.alignCenterY();
        level_1_7.alignLeftTo(level_1_6.right() + Dimen.storyMenuPadding());
        level_1_7.setText("7");

        // -- Level 1-8 --
        UIButton level_1_8 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-8");
                LevelStory level = new LevelStory(this.handler.game, 8);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_8);
        level_1_8.handler = this;
        level_1_8.setWidth(Dimen.menuHeight());
        level_1_8.setHeight(Dimen.menuHeight());
        level_1_8.alignCenterY();
        level_1_8.alignLeftTo(level_1_7.right() + Dimen.storyMenuPadding());
        level_1_8.setText("8");

        // -- Level 1-9 --
        UIButton level_1_9 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-9");
                LevelStory level = new LevelStory(this.handler.game, 9);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_1_level_container.addChild(level_1_9);
        level_1_9.handler = this;
        level_1_9.setWidth(Dimen.menuHeight());
        level_1_9.setHeight(Dimen.menuHeight());
        level_1_9.alignCenterY();
        level_1_9.alignLeftTo(level_1_8.right() + Dimen.storyMenuPadding());
        level_1_9.setText("9");

        level_1_level_container.fitToChildrenX();
        level_1_level_container.alignCenterWithChildrenX();
        level_1_container.setHeight(level_1_container.height() + Dimen.storyMenuPadding());


        // --- Level 2 ---
        UIContainer level_2_container = new UIContainer();
        this.root.addChild(level_2_container);
        level_2_container.fillParentWidth();
        level_2_container.setHeight(Dimen.menuHeight() * 2);
        level_2_container.alignTopTo(level_1_container.bottom());
        level_2_container.setFill(new Colour(128, 55, 55, 32));
        

        UIContainer level_2_title = new UIContainer();
        level_2_container.addChild(level_2_title);
        level_2_title.fillParentWidth();
        level_2_title.setHeight(Dimen.menuHeight());
        level_2_title.alignTop();
        level_2_title.setText("Level 2");
        level_2_title.setTextSize(Dimen.menuTextSize());
        
        UIContainer level_2_level_container = new UIContainer();
        level_2_container.addChild(level_2_level_container);
        level_2_level_container.setHeight(Dimen.menuHeight());
        level_2_level_container.alignBottom();

        // -- Level 2-1 --
        UIButton level_2_1 = new UIButton() {
            protected void onClick() {
                println("Loading Level 2-1");
                LevelStory level = new LevelStory(this.handler.game, 11);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_2_level_container.addChild(level_2_1);
        level_2_1.handler = this;
        level_2_1.setWidth(Dimen.menuHeight());
        level_2_1.setHeight(Dimen.menuHeight());
        level_2_1.alignCenterY();
        level_2_1.alignLeftTo(level_2_level_container.left() + Dimen.storyMenuPadding());
        level_2_1.setText("1");

        // -- Level 2-2 --
        UIButton level_2_2 = new UIButton() {
            protected void onClick() {
                println("Loading Level 2-2");
                LevelStory level = new LevelStory(this.handler.game, 12);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_2_level_container.addChild(level_2_2);
        level_2_2.handler = this;
        level_2_2.setWidth(Dimen.menuHeight());
        level_2_2.setHeight(Dimen.menuHeight());
        level_2_2.alignCenterY();
        level_2_2.alignLeftTo(level_2_1.right() + Dimen.storyMenuPadding());
        level_2_2.setText("2");


        // -- Level 2-3 --
        UIButton level_2_3 = new UIButton() {
            protected void onClick() {
                println("Loading Level 1-3");
                LevelStory level = new LevelStory(this.handler.game, 13);
                this.handler.game.currentLevel = level;
                this.handler.resetRoot();
            }
        };
        level_2_level_container.addChild(level_2_3);
        level_2_3.handler = this;
        level_2_3.setWidth(Dimen.menuHeight());
        level_2_3.setHeight(Dimen.menuHeight());
        level_2_3.alignCenterY();
        level_2_3.alignLeftTo(level_2_2.right() + Dimen.storyMenuPadding());
        level_2_3.setText("3");

        level_2_level_container.fitToChildrenX();
        level_2_level_container.alignCenterWithChildrenX();
        level_2_container.setHeight(level_2_container.height() + Dimen.storyMenuPadding());


        // --- Back Button ---
        UIButton back = new UIButton() {
            protected void onClick() {
                this.handler.main_menu();
            }
        };
        menuContainer.addChild(back);
        back.handler = this;
        back.setWidth(Dimen.menuWidth());
        back.setHeight(Dimen.menuHeight());
        back.alignBottom();
        back.alignCenterX();
        back.setText("Back");
        back.setTextSize(Dimen.menuTextSize);
    }

    // ----- Story Mode -----

    public void story_solved(boolean nextValid) {
        this.resetRoot();

        // Container for the menu.
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.setFill(new Colour(128, 128, 182, 128));

        UIContainer movesMade = new UIContainer();
        menuContainer.addChild(movesMade);
        movesMade.setWidth(Dimen.menuWidth());
        movesMade.setHeight(Dimen.menuHeight());
        movesMade.setText("Moves made: " + this.game.currentLevel.numberOfMovesMade());

        // Return to menu button.
        UIButton backToMenu = new UIButton() {
            protected void onClick() {
                this.handler.story_menu();
                this.handler.game.currentLevel = null;
            }
        };
        menuContainer.addChild(backToMenu);
        backToMenu.handler = this;
        backToMenu.setWidth(Dimen.menuWidth() / 2);
        backToMenu.setHeight(Dimen.menuHeight());
        backToMenu.alignTopTo(movesMade.bottom());
        backToMenu.setText("Return To Menu");
        backToMenu.setTextSize(Dimen.menuTextSize());

        if (nextValid) {
            // Next level button.
            UIButton nextLevel = new UIButton() {
                protected void onClick() {
                    int id = ((LevelStory) this.handler.game.currentLevel).getID();
                    LevelStory level = new LevelStory(this.handler.game, id + 1);
                    this.handler.game.currentLevel = level;
                    this.handler.resetRoot();
                }
            };
            menuContainer.addChild(nextLevel);
            nextLevel.handler = this;
            nextLevel.setWidth(Dimen.menuWidth() / 2);
            nextLevel.setHeight(Dimen.menuHeight());
            nextLevel.alignTopTo(movesMade.bottom());
            nextLevel.alignLeftTo(backToMenu.right());
            nextLevel.setText("Next Level");
            nextLevel.setTextSize(Dimen.menuTextSize());
        } else {
            backToMenu.setWidth(Dimen.menuWidth());
        }


        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();
    }

    public void story_esc() {
        this.resetRoot();

        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);

        UIButton resetLevel = new UIButton() {
            protected void onClick() {
                ((LevelStory) this.handler.game.currentLevel).reload();
                this.handler.resetRoot();
            }
        };
        menuContainer.addChild(resetLevel);
        resetLevel.handler = this;
        resetLevel.setWidth(Dimen.menuWidth);
        resetLevel.setHeight(Dimen.menuHeight);
        resetLevel.setText("Reset Level");

        UIButton exit = new UIButton() {
            protected void onClick() {
                this.handler.game.currentLevel = null;
                this.handler.story_menu();
            }
        };
        menuContainer.addChild(exit);
        exit.handler = this;
        exit.setWidth(Dimen.menuWidth);
        exit.setHeight(Dimen.menuHeight);
        exit.alignTopTo(resetLevel.bottom());
        exit.setText("Exit");

        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();

    }

    // ----- Endless Mode -----

    public void endless_finished() {
        this.resetRoot();

        // Menu Container
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);

        int levelsCompleted = ((LevelRandom) this.game.currentLevel).getDifficulty() - LevelRandom.difficultyStart;
        float timeLasted = int(LevelRandom.timerStart + levelsCompleted * 5);

        UIContainer levels = new UIContainer();
        menuContainer.addChild(levels);
        levels.setWidth(Dimen.menuWidth);
        levels.setHeight(Dimen.menuHeight);
        levels.setText("You completed " + levelsCompleted + " levels!");

        UIContainer time = new UIContainer();
        menuContainer.addChild(time);
        time.setWidth(Dimen.menuWidth);
        time.setHeight(Dimen.menuHeight);
        time.alignTopTo(levels.bottom());
        time.setText("You lasted " + timeLasted + " seconds!");

        UIButton exit = new UIButton() {
            protected void onClick() {
                this.handler.game.currentLevel = null;
                this.handler.main_menu();
            }
        };
        menuContainer.addChild(exit);
        exit.handler = this;
        exit.setWidth(Dimen.menuWidth);
        exit.setHeight(Dimen.menuHeight);
        exit.alignTopTo(time.bottom());
        exit.setText("Exit");

        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();
    }

    public void settings_menu() {
        this.resetRoot();

        // The Settings title
        UIContainer title = new UIContainer();
        this.root.addChild(title);
        title.setHeight(Dimen.menuHeight() * 2);
        title.fillParentWidth();
        title.alignTop();
        title.setText("Settings");
        title.setTextSize(Dimen.headingTextSize());

        // Menu Container
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.setWidth(Dimen.menuWidth());
        menuContainer.alignCenterX();

        // Resolution Setting

        UIContainer resContainer = new UIContainer();
        menuContainer.addChild(resContainer);
        resContainer.fillParentWidth();
        resContainer.setHeight(Dimen.menuHeight() * 2);
        resContainer.alignTop();

        UIContainer resolution = new UIContainer();
        resContainer.addChild(resolution);
        resolution.fillParentWidth();
        resolution.setHeight(Dimen.menuHeight());
        resolution.alignTop();
        resolution.setText("Resolution");
        resolution.setTextSize(Dimen.menuTextSize());

        UIContainer resChanger = new UIContainer();
        resContainer.addChild(resChanger);
        resChanger.fillParentWidth();
        resChanger.setHeight(Dimen.menuHeight());
        resChanger.alignBottom();
        resChanger.setText(Dimen.currentSizeX() + "x" + Dimen.currentSizeY());
        resChanger.setTextSize(Dimen.menuTextSize());

        UIButton resChangerLeft = new UIButton() {
            protected void onClick() {
                println("Left!");
                if (Dimen.currentResolution == 0) return;
                Dimen.currentResolution -= 1;
                surface.setSize(Dimen.currentSizeX(), Dimen.currentSizeY());
                Resources.currentBgImage = loadImage(Resources.currentBgImagePath());
                this.handler.settings_menu();
            }
        };
        resChanger.addChild(resChangerLeft);
        resChangerLeft.handler = this;
        resChangerLeft.setWidth(Dimen.menuHeight());
        resChangerLeft.setHeight(Dimen.menuHeight());
        resChangerLeft.alignTop();
        resChangerLeft.alignLeft();
        resChangerLeft.setText("<");
        resChangerLeft.setTextSize(Dimen.menuTextSize());

        UIButton resChangerRight = new UIButton() {
            protected void onClick() {
                println("Right!");
                if (Dimen.currentResolution == Dimen.availableResolutions.size() - 1) {
                    this.setFill(new Colour(0, 0, 0, 127));
                    return;
                }
                this.setFill(null);
                Dimen.currentResolution += 1;
                surface.setSize(Dimen.currentSizeX(), Dimen.currentSizeY());
                Resources.currentBgImage = loadImage(Resources.currentBgImagePath());
                this.handler.settings_menu();
            }
        };
        resChanger.addChild(resChangerRight);
        resChangerRight.handler = this;
        resChangerRight.setWidth(Dimen.menuHeight());
        resChangerRight.setHeight(Dimen.menuHeight());
        resChangerRight.alignTop();
        resChangerRight.alignRight();
        resChangerRight.setText(">");
        resChangerRight.setTextSize(Dimen.menuTextSize());

        UIButton backBtn = new UIButton() {
            protected void onClick() {
                println("Back!");
                this.handler.main_menu();
            }
        };
        menuContainer.addChild(backBtn);
        backBtn.handler = this;
        backBtn.fillParentWidth();
        backBtn.setHeight(Dimen.menuHeight());
        backBtn.alignTopTo(resContainer.bottom());
        backBtn.setText("Back");
        backBtn.setTextSize(Dimen.menuTextSize());

        menuContainer.fitToChildrenY();
        menuContainer.alignCenterWithChildrenY();

    }

    // ----- LEVEL EDITOR -----

    public void level_editor_select() {
        this.resetRoot();

        // The Settings title
        UIContainer title = new UIContainer();
        this.root.addChild(title);
        title.setHeight(Dimen.menuHeight() * 2);
        title.setWidth(Dimen.menuWidth());
        title.alignTop();
        title.alignCenterX();
        title.setText("Level Editor");
        title.setTextSize(Dimen.headingTextSize());

        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);

        // New Level
        UIButton newLevel = new UIButton() {
            protected void onClick() {
                println("New Level!");
                this.handler.game.currentLevel = new LevelEditor(this.handler.game);
                this.handler.level_editor();
            }
        };
        menuContainer.addChild(newLevel);
        newLevel.handler = this;
        newLevel.setWidth(Dimen.menuWidth());
        newLevel.setHeight(Dimen.menuHeight());
        newLevel.setText("New Level");
        newLevel.setTextSize(Dimen.menuTextSize());

        // Load Level
        UIButton loadLevel = new UIButton() {
            protected void onClick() {
                println("Load Level!");
                selectInput("Select a file to load:", "load_level_from_file", null, this.handler);
            }
        };
        menuContainer.addChild(loadLevel);
        loadLevel.handler = this;
        loadLevel.setWidth(Dimen.menuWidth());
        loadLevel.setHeight(Dimen.menuHeight());
        loadLevel.alignTopTo(newLevel.bottom());
        loadLevel.setText("Load Level");
        loadLevel.setTextSize(Dimen.menuTextSize());

        // Back
        UIButton backBtn = new UIButton() {
            protected void onClick() {
                println("Back!");
                this.handler.main_menu();
            }
        };
        menuContainer.addChild(backBtn);
        backBtn.handler = this;
        backBtn.setWidth(Dimen.menuWidth());
        backBtn.setHeight(Dimen.menuHeight());
        backBtn.alignTopTo(loadLevel.bottom());
        backBtn.setText("Back");
        backBtn.setTextSize(Dimen.menuTextSize());

        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();
    }

    // Callback function for the level editors file selector.
    public void load_level_from_file(File selection) {
        if (selection == null) {
            println("No file was selected!");
            return;
        } else {
            String filePath = selection.getAbsolutePath();
            println(filePath);
            this.game.currentLevel = new LevelEditor(this.game, filePath);
            this.level_editor();
        }
    }

    public void level_editor() {
        this.resetRoot();

        UIContainer hint = new UIContainer();
        this.root.addChild(hint);
        hint.setHeight(Dimen.menuHeight());
        hint.setWidth(Dimen.menuWidth());
        hint.alignBottom();
        hint.alignRight();
        hint.setText("Press 'esc' to open menu");
        hint.setTextSize(Dimen.menuTextSize());
    }

    public void level_editor_esc() {
        this.resetRoot();
        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);

        UIButton saveas = new UIButton() {
            protected void onClick() {
                this.handler.level_editor_esc_saveas();
            }
        };
        menuContainer.addChild(saveas);
        saveas.handler = this;
        saveas.setWidth(Dimen.menuWidth());
        saveas.setHeight(Dimen.menuHeight());
        saveas.setText("Save As...");
        saveas.setTextSize(Dimen.menuTextSize());

        UIButton exit = new UIButton() {
            protected void onClick() {
                this.handler.game.currentLevel = null;
                this.handler.settings_menu();
            }
        };
        menuContainer.addChild(exit);
        exit.handler = this;
        exit.setWidth(Dimen.menuWidth());
        exit.setHeight(Dimen.menuHeight());
        exit.alignTopTo(saveas.bottom());
        exit.setText("Exit");
        exit.setTextSize(Dimen.menuTextSize());

        if (this.game.currentLevel.getFilePath() != null) {
            UIButton save = new UIButton() {
                protected void onClick() {
                    this.handler.level_editor_esc_save();
                }
            };
            menuContainer.addChild(save);
            save.handler = this;
            save.setWidth(Dimen.menuWidth());
            save.setHeight(Dimen.menuHeight());
            save.setText("Save");
            save.setTextSize(Dimen.menuTextSize());

            saveas.alignTopTo(save.bottom());
            exit.alignTopTo(saveas.bottom());
        }

        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();
    }

    // Save the open level to its file.
    public void level_editor_esc_save() {
        this.resetRoot();
        // First check that this level did indeed get loaded from a file.
        if (this.game.currentLevel.getFilePath() == null) this.level_editor_esc_saveas();

    
        println("Saving level to file.");
        this.game.levelIO.saveLevelToFile(this.game.currentLevel, this.game.currentLevel.getFilePath());

        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);

        UIContainer saved = new UIContainer();
        menuContainer.addChild(saved);
        saved.setWidth(Dimen.menuWidth());
        saved.setHeight(Dimen.menuHeight());
        saved.setText("Level Saved!");
        saved.setTextSize(Dimen.menuTextSize());

        UIButton okay = new UIButton() {
            protected void onClick() {
                println("Okay");
                this.handler.level_editor_esc();
            }
        };
        menuContainer.addChild(okay);
        okay.handler = this;
        okay.setWidth(Dimen.menuWidth());
        okay.setHeight(Dimen.menuHeight());
        okay.alignTopTo(saved.bottom());
        okay.setText("Okay");
        okay.setTextSize(Dimen.menuTextSize());

        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();
    }

    // Save the level to a new file.
    public void level_editor_esc_saveas() {
        this.resetRoot();

        UIContainer menuContainer = new UIContainer();
        this.root.addChild(menuContainer);
        menuContainer.setWidth(Dimen.menuWidth());
        menuContainer.setPadding(10);

        UITextInput levelName = new UITextInput() {
            protected void onSubmit() {
                println("Saving level to file.");
                String filePath = "levels/" + this.getInput() + ".utg";
                this.handler.game.levelIO.saveLevelToFile(this.handler.game.currentLevel, filePath);
                this.handler.game.currentLevel.setFilePath(filePath);
                this.handler.level_editor_esc();
            }
        };
        menuContainer.addChild(levelName);
        levelName.handler = this;
        levelName.fillParentWidth();
        levelName.setHeight(Dimen.menuHeight());
        levelName.setHint("enter level name");
        levelName.setTextSize(Dimen.menuTextSize());

        UIButton cancel = new UIButton() {
            protected void onClick() {
                println("Canceled saving.");
                this.handler.level_editor_esc();
            }
        };
        menuContainer.addChild(cancel);
        cancel.handler = this;
        cancel.setWidth(menuContainer.width() / 2);
        cancel.setHeight(Dimen.menuHeight());
        cancel.alignLeft();
        cancel.alignTopTo(levelName.bottom());
        cancel.setText("Cancel");
        cancel.setTextSize(Dimen.menuTextSize());

        UIButton save = new UIButton() {
            protected void onClick() {
                println("Saving.");
                this.linkedTextInput.submit();
                this.handler.level_editor_esc();
            }
        };
        menuContainer.addChild(save);
        save.handler = this;
        save.linkedTextInput = levelName;
        save.setWidth(menuContainer.width() / 2);
        save.setHeight(Dimen.menuHeight());
        save.alignLeftTo(cancel.right());
        save.alignTopTo(levelName.bottom());
        save.setText("Save");
        save.setTextSize(Dimen.menuTextSize());

        menuContainer.fitToChildren();
        menuContainer.alignCenterWithChildren();

    }

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}