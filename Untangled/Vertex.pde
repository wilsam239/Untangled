/**
  Vertex class, represents the circles on the page.
  Have an x,y position
*/

class Vertex {
    private float xPos, yPos;
    private int fillColour = Colours.vertexFill;
    private boolean selected = false;
    private boolean hovered = false;

    private LevelInterface level;
    
    Vertex() {
        this.xPos = 0;
        this.yPos = 0;

        this.level = null;
    };
    
    Vertex(float x, float y, LevelInterface level) {
        this.xPos = x;
        this.yPos = y;

        this.level = level;
    }
    
    public float x() { return this.xPos; }
    public float y() { return this.yPos; }
  
    public void draw() {
        // Draw the ellipse. Default ellipseMode is CENTER, so the x and y position is the center of the ellipse.
        fill(this.fillColour);
        stroke(Colours.vertexStroke);
        ellipse(this.x(), this.y(), Dimen.vertexDim, Dimen.vertexDim);
    }

    public void select() {
        this.selected = !this.selected;
        this.fillColour = this.selected ? Colours.vertexFillSelected : Colours.vertexFill;
    }

    public void hover() {
        this.hovered = true;
        this.fillColour = Colours.vertexFillHovered;
    }

    public void clearHover() {
        this.hovered = false;
        this.fillColour = this.selected ? Colours.vertexFillSelected : Colours.vertexFill;
    }

    public boolean hovered() {
        return this.hovered;
    }

    public boolean selected() {
        return this.selected;
    }

    public void move(float xPos, float yPos) {
        this.xPos = xPos;
        this.yPos = yPos;
    }
}
