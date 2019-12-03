class UIContainer extends UIElement {

    private ArrayList<UIElement> children = new ArrayList();

    public UIContainer() {

    }

    public void addChild(UIElement e) {
        this.children.add(e);
    }

    public void update() {
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