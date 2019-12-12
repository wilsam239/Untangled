class UIButton extends UIElement {

    public UIHandler handler;

    public UIButton() { }

    public UIButton(float x, float y, float width, float height) {
        this.setLocationAndSize(x, y, width, height);
    }

    @Override
    public void update() {
        super.update();

        if (this.handler == null) {
            println("WARNING: Button handler is not set!");
        }

        if (hover() && click()) {
            onClick();
            // Clear the buffers to prevent any other event happening behind the button. 
        }

        if (!hover() && Mouse.clickedButton == this) Mouse.clickedButton = null;
    }

    int hoverTimer = 0;

    protected boolean hover() {
        // Check if the mouse is within the bounds of the button.
        if (Mouse.x > this.left()
        && Mouse.x < this.right()
        && Mouse.y > this.top()
        && Mouse.y < this.bottom()) {
            // Increment hover timer.
            if (this.hoverTimer < 256)this.hoverTimer += 8;
            return true;
        }
        if (this.hoverTimer > 0) this.hoverTimer -= 8;
        return false;
    }

    protected boolean click() {
        if (Mouse.btnReleased.hasValue(Mouse.LEFT) && Mouse.clickedButton == this) {
            Mouse.clickedButton = null;
            Mouse.clearBuffers();
            return true;
        } else {
            if (Mouse.btnPressed.hasValue(Mouse.LEFT)) {
                Mouse.clickedButton = this;
                Mouse.clearBuffers();
            }
            return false;
        }
    }

    protected void onClick() {
        println("WARNING: UIButton.onClick() should be defined on a per-instance basis!");
    }

    @Override
    public void draw() {
        fill(Colours.waterfall.R, Colours.waterfall.G, Colours.waterfall.B, this.hoverTimer);
        rect(this.x(), this.y(), this.width(), this.height());
        super.draw();
    }

}