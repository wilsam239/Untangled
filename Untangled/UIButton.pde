class UIButton extends UIElement {

    public UIButton() { }

    public UIButton(float top, float bottom, float left, float right) {
        this.top = top;
        this.bottom = bottom;
        this.left = left;
        this.right = right;
    }

    @Override
    public void draw() {
        fill(255, 0, 255);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

}