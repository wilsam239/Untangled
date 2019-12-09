/**
  Vertex class, represents the circles on the page.
  Have an x,y position
*/

class Vertex {
    private PVector position;
    private int fillColour = Colours.vertexFill;
    private boolean selected = false;
    private boolean hovered = false;
    
    Vertex() {
        this.position = new PVector(0, 0);
    };
    
    Vertex(float x, float y) {
        this.position = new PVector(x, y);
    }

    Vertex(Vertex clone) {
        this.position = new PVector(clone.position.x, clone.position.y);
        this.selected = clone.selected;
        this.hovered = clone.hovered;
    }
    

    public float x() { return this.position.x; }
    public float y() { return this.position.y; }

    public boolean compare(Vertex other) {
        return (this.position.x == other.position.x && this.position.y == other.position.y);
    }
    
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
        this.position.x = xPos;
        this.position.y = yPos;
    }
}
