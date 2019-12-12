class UIContainer extends UIElement {

    public UIContainer() {

    }

    public void update() {
        super.update();
        for (int i = 0; i < this.children.size(); i++) {
            this.children.get(i).update();
        }
    }

    public void draw() {
        super.draw();
        for (int i = 0; i < this.children.size(); i++) {
            this.children.get(i).draw();
        }
    }

}