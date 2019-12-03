class UIContainer extends UIElement {

    private ArrayList<UIElement> children = new ArrayList();

    public UIContainer() {

    }

    public void addChild(UIElement e) {
        this.children.add(e);
    }

    public void update() {
        for (UIElement e : this.children) {
            e.update();
        }
    }

    public void draw() {
        super.draw();
        for (UIElement e : this.children) {
            e.draw();
        }
    }

}