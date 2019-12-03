class UIHandler {

    public UIContainer root;

    public UIHandler(int width, int height) {
        // Set the root to be the entire size of the screen.
        this.root = new UIContainer();
        this.root.top = 0;
        this.root.bottom = height;
        this.root.left = 0;
        this.root.right = width;
    }

    // The games main menu.
    public void main_menu() {
        this.root.children.clear();
        
        UIButton startGame = new UIButton(50, 50, 200, 100) {
            protected void onClick() {
                println("Start Game was pressed!");
            }
        };
        startGame.handler = this;
        startGame.parent = this.root;
        startGame.btnText = "START GAME";
        
        this.root.children.add(startGame);
        
        UIButton settings = new UIButton(50, 100, 200, 150) {
            protected void onClick() {
                println("Settings was pressed!");
                this.handler.settings_menu();
            }
        };
        settings.handler = this;
        settings.parent = this.root;
        settings.btnText = "SETTINGS";

        this.root.children.add(settings);
    }

    // The settings menu
    public void settings_menu() {
        this.root.children.clear();

        UIButton back = new UIButton(50, 50, 200, 100) {
            protected void onClick() {
                this.handler.main_menu();
            }
        };
        back.handler = this;
        back.parent = this.root;
        back.btnText = "BACK";
        
        this.root.children.add(back);
    }

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}