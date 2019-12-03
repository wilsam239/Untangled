abstract class UIElement {
    
    public float top = 0;
    public float bottom = 100;
    public float left = 0;
    public float right = 100;

    public UIElement parent = null;

    public String btnText = "";

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

    public void fillParentWidth() {
        if (this.parent == null) return;
        this.left = this.parent.left;
        this.right = this.parent.right;
    }

    public void fillParentHeight() {
        if (this.parent == null) return;
        this.top = this.parent.top;
        this.bottom = this.parent.bottom;
    }

    // Update, hover, and click.

    public void update() {
        
    }

    // Draw
    private int debugRed = (int) random(255);
    private int debugGreen = (int) random(255);
    private int debugBlue = (int) random(255);
    public void draw() {
        // Draw the text.
        fill(0);
        textAlign(CENTER);
        text(this.btnText, this.left + (this.right - this.left) / 2, this.top + (textAscent()) / 2 + (this.bottom - this.top) / 2);
        
        fill(0, 0);
        stroke(debugRed, debugGreen, debugBlue);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

}