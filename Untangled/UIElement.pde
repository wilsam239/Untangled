abstract class UIElement {
    
    public float top = 0;
    public float bottom = 100;
    public float left = 0;
    public float right = 100;

    public UIElement parent = null;

    public String btnText = "";

    public boolean hasImage = false;
    public PImage bImage;

    public void setImage(PImage image) {
        this.bImage = image;
        this.hasImage = true;
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

    // Keep the width fixed, but alter the height of this
    // element so that the images aspect ratio is maintained.
    public void fitHeightToImage() {
        float ratio = (this.right - this.left) / this.bImage.width;
        float adjustedHeight = this.bImage.height * ratio;
        this.bottom = this.top + adjustedHeight;
    }

    // Keep the height fixed, but alter the width of this
    // element so that the images aspect ratio is maintained.
    public void fitWidthToImage() {
        float ratio = (this.bottom - this.top) / this.bImage.height;
        float adjustedWidth = this.bImage.width * ratio;
        this.right = this.left + adjustedWidth;
    } 

    // Update, hover, and click.

    public void update() {
        
    }

    // Draw
    private int debugRed = (int) random(127);
    private int debugGreen = (int) random(127);
    private int debugBlue = (int) random(127);
    public void draw() {
        // Draw the image.
        if (this.hasImage) drawImage();

        // Draw the text.
        fill(0);
        textAlign(CENTER);
        textSize(14);
        text(this.btnText, this.left + (this.right - this.left) / 2, this.top + 7 + (this.bottom - this.top) / 2);
        
        fill(0, 0);
        stroke(debugRed, debugGreen, debugBlue);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

    public void drawImage() {
        image(this.bImage, this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

}