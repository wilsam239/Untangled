class UIButton extends UIElement {

    public UIButton() { }

    public UIButton(float left, float top, float right, float bottom) {
        this.top = top;
        this.bottom = bottom;
        this.left = left;
        this.right = right;
    }

    @Override
    public void update() {
        if (hover() && click()) {
            onClick();
        }
    }

    int hoverTimer = 0;

    protected boolean hover() {
        // Check if the mouse is within the bounds of the button.
        if (Mouse.x > this.left
        && Mouse.x < this.right
        && Mouse.y > this.top
        && Mouse.y < this.bottom) {
            // Increment hover timer.
            if (this.hoverTimer < 120)this.hoverTimer++;
            return true;
        }
        if (this.hoverTimer > 0) this.hoverTimer--;
        return false;
    }

    protected boolean click() {
        return Mouse.btnPressed.hasValue(Mouse.LEFT);
    }

    
    protected void onClick() {

    }

    @Override
    public void draw() {
        super.draw();
        fill(255, 0, 255, this.hoverTimer);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

}