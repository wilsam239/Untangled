abstract class UIElement {
    
    public float top = 0;
    public float bottom = 100;
    public float left = 0;
    public float right = 100;

    public UIElement() {

    }

    // ----- ALIGNMENT -----

    public void alignTopToTopOf(UIElement e) {
        this.top = e.top;
    }

    public void alignTopToBottomOf(UIElement e) {
        this.top = e.bottom;
    }

    public void alignBottomToTopOf(UIElement e) {
        this.bottom = e.top;
    }

    public void alignBottomToBottomOf(UIElement e) {
        this.bottom = e.bottom;
    }

    public void alignLeftToLeftOf(UIElement e) {
        this.left = e.left;
    }

    public void alignLeftToRightOf(UIElement e) {
        this.left = e.right;
    }

    public void alignRightToLeftOf(UIElement e) {
        this.right = e.left;
    }

    public void alignRightToRightOf(UIElement e) {
        this.right = e.right;
    }

    // Update, hover, and click.

    public void update() {
        if (hover() && click()) {
            onClick();
        }
    }

    protected boolean hover() {
        return false;
    }

    protected boolean click() {
        return Mouse.buttons.hasValue(Mouse.LEFT);
    }

    protected void onClick() {

    }

    // Draw
    private int debugRed = (int) random(255);
    private int debugGreen = (int) random(255);
    private int debugBlue = (int) random(255);
    public void draw() {
        fill(0, 0);
        stroke(debugRed, debugGreen, debugBlue);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

}