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

    public void main_menu() {
        this.root.children.clear();
        
        UIButton startGame = new UIButton(50, 50, 200, 100);
        startGame.parent = this.root;

        this.root.children.add(startGame);
    }

    public void update() {
        this.root.update();
    }

    public void draw() {
        this.root.draw();
    }

}