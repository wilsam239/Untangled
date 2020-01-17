abstract class UIElement {
    
    // Array containing all of this elements children
    protected ArrayList<UIElement> children = new ArrayList();

    // The parent of this element
    protected UIElement parent = null;

    // The elements fill colour
    private Colour fill = null;

    // The elements text
    protected String text = null;
    private float textSize = Dimen.menuTextSize;

    // Padding for inner elements when fitting to children
    private float paddingTop = 0;
    private float paddingBottom = 0;
    private float paddingLeft = 0;
    private float paddingRight = 0;

    // The elements image
    private PImage bImage = null;

    // Private position variables
    private float x = 0;
    private float y = 0;
    private float width = 0;
    private float height = 0;

    // For making sure that each of the required dimens is set
    private boolean xIsSet = false;
    private boolean yIsSet = false;
    private boolean widthIsSet = false;
    private boolean heightIsSet = false;

    // Getters for location and size
    public float x() {
        return this.x;
    }

    public float y() {
        return this.y;
    }

    public float width() {
        return this.width;
    }

    public float height() {
        return this.height;
    }

    // Getters for edges
    public float top() {
        return this.y;
    }

    public float bottom() {
        return this.y + this.height;
    }

    public float left() {
        return this.x;
    }

    public float right() {
        return this.x + this.width;
    }

    // Getters for the center of the element

    public float centerX() {
        return (this.left() + this.right()) / 2;
    }

    public float centerY() {
        return (this.top() + this.bottom()) / 2;
    }

    // Setters for location and size

    public void setLocationAndSize(float x, float y, float width, float height) {
        this.setPosition(x, y);
        this.setSize(width, height);
    }

    public void setPosition(float x, float y) {
        this.setX(x);
        this.setY(y);
    }

    public void setX(float x) {
        this.x = x;
        this.xIsSet = true;
    }

    public void setY(float y) {
        this.y = y;
        this.yIsSet = true;
    }

    public void setSize(float width, float height) {
        this.setWidth(width);
        this.setHeight(height);
    }

    public void setWidth(float width) {
        this.width = width;
        this.widthIsSet = true;
    }

    public void setHeight(float height) {
        this.height = height;
        this.heightIsSet = true;
    }

    // Setters for edges

    public void setTop(float num) {
        float bottom = this.bottom();
        this.setY(num);
        this.height = bottom - this.y();
    }

    public void setBottom(float num) {
        this.setHeight(num - this.y());
    }

    public void setLeft(float num) {
        float right = this.right();
        this.setX(num);
        this.width = right - this.x();
    }

    public void setRight(float num) {
        this.setWidth(num - this.x());
    }

    // Alignment for edges

    public void alignTopTo(float num) {
        this.setY(num);
    }

    public void alignBottomTo(float num) {
        this.setY(num - this.height());
    }

    public void alignLeftTo(float num) {
        this.setX(num);
    }

    public void alignRightTo(float num) {
        this.setX(num - this.width());
    }

    // Alignment in parent

    public void alignTop() {
        this.alignTopTo(this.parent.top());
    }

    public void alignBottom() {
        this.alignBottomTo(this.parent.bottom());
    }

    public void alignLeft() {
        this.alignLeftTo(this.parent.left());
    }

    public void alignRight() {
        this.alignRightTo(this.parent.right());
    }

    public void alignCenter() {
        this.alignCenterX();
        this.alignCenterY();
    }

    public void alignCenterX() {
        this.setX(this.parent.centerX() - (this.width() / 2));
    }

    public void alignCenterY() {
        this.setY(this.parent.centerY() - (this.height() / 2));
    }

    public void alignCenterWithChildren() {
        alignCenterWithChildrenX();
        alignCenterWithChildrenY();
    }

    public void alignCenterWithChildrenX() {
        float oldPos = this.x();
        alignCenterX();
        float diff = oldPos - this.x();

        for (UIElement child : this.children) {
            child.alignLeftTo(child.x() - diff);
        }
    }

    public void alignCenterWithChildrenY() {
        float oldPos = this.y();
        alignCenterY();
        float diff = oldPos - this.y();

        for (UIElement child : this.children) {
            child.alignTopTo(child.y() - diff);
        }
    }

    // Fill parent

    public void fillParent() {
        this.fillParentWidth();
        this.fillParentHeight();
    }

    public void fillParentWidth() {
        this.setLeft(this.parent.left());
        this.setRight(this.parent.right());
    }

    public void fillParentHeight() {
        this.setTop(this.parent.top());
        this.setBottom(this.parent.bottom());
    }

    // Fitting to content

    public void fitToChildren() {
        fitToChildrenX();
        fitToChildrenY();
    }

    public void fitToChildrenX() {
        FloatList min = new FloatList();
        FloatList max = new FloatList();
        for (UIElement child : this.children) {
            min.append(child.left());
            max.append(child.right());
        }
        this.setLeft(min.min() + this.paddingLeft);
        this.setRight(max.max() + this.paddingRight);
    }

    public void fitToChildrenY() {
        FloatList min = new FloatList();
        FloatList max = new FloatList();
        for (UIElement child : this.children) {
            min.append(child.top());
            max.append(child.bottom());
        }
        this.setTop(min.min() + this.paddingTop);
        this.setBottom(max.max() + this.paddingBottom);
    }

    // Fitting to image

    public void fitToImage() {
        this.setWidth(this.bImage.height * Dimen.displayRatio());
        this.setHeight(this.bImage.width * Dimen.displayRatio());
    }

    public void fitToImageMaintainWidth() {
        float ratio = this.width / this.bImage.width;
        this.setHeight(this.bImage.height * ratio);
    }

    public void fitToImageMaintainHeight() {
        float ratio = this.height / this.bImage.height;
        this.setWidth(this.bImage.width * ratio);
    }

    // Adding a child element
    
    public void addChild(UIElement e) {
        e.parent = this;
        this.children.add(e);
    }

    // Set image

    public void setImage(PImage image) {
        this.bImage = image;
    }

    // Set fill

    public void setFill(Colour colour) {
        this.fill = colour;
    }

    // Set text

    public void setText(String text) {
        this.text = text;
    }

    public void setTextSize(float size) {
        this.textSize = size;
    }

    // Set padding

    public void setPadding(float all) {
        this.paddingTop = all;
        this.paddingBottom = all;
        this.paddingLeft = all;
        this.paddingRight = all;
    }

    public void setPadding(float top, float right, float bottom, float left) {
        this.paddingTop = top;
        this.paddingBottom = bottom;
        this.paddingLeft = left;
        this.paddingRight = right;
    }

    // Update

    public void update() {
        if(!this.xIsSet) {
            println("WARNING: X position is not explicitly set on UIElement!");
        }
        if(!this.yIsSet) {
            println("WARNING: Y position is not explicitly set on UIElement!");
        }
        if(!this.widthIsSet) {
            println("WARNING: Width is not explicitly set on UIElement!");
        }
        if(!this.heightIsSet) {
            println("WARNING: Height is not explicitly set on UIElement!");
        }
    }

    // Drawing
    
    public void draw() {
        if (this.bImage != null) this.drawImage();
        if (this.fill != null) this.drawFill();
        if (this.text != null) this.drawText();
    }

    private void drawImage() {
        image(this.bImage, this.x(), this.y(), this.width(), this.height());
    }

    private void drawFill() {
        fill(this.fill.R, this.fill.G, this.fill.B, this.fill.A);
        rect(this.x(), this.y(), this.width(), this.height());
    }

    private void drawText() {
        fill(0);
        textFont(Resources.gentleTouch);
        textAlign(CENTER);
        textSize(this.textSize);
        text(this.text, this.centerX(), this.centerY() + (this.textSize / 2));
    }

    // Debug Drawing

    private int debugRed = (int) random(127);
    private int debugGreen = (int) random(127);
    private int debugBlue = (int) random(127);

    private void drawDebug() {
        stroke(debugRed, debugGreen, debugBlue);
        rect(this.x(), this.y(), this.width(), this.height());
    }

}