/**
  Vertex class, represents the circles on the page.
  Have an x,y position
*/

class Vertex {
    private float xPos, yPos;
    private float left, right, top, bottom;
    private int fillColour = Colours.vertexFill;
    private boolean selected = false;
    private boolean hovered = false;
    
    Vertex() {
        this.xPos = 0;
        this.yPos = 0;
    };
    
    Vertex(float x, float y) {
        this.xPos = x;
        this.yPos = y;
        this.left = x - Dimen.vertexDim/2;
        this.right = x + Dimen.vertexDim/2;
        this.top = y - Dimen.vertexDim/2;
        this.bottom =  y + Dimen.vertexDim/2;
    }
    
    public float x() { return this.xPos; }
    public float y() { return this.yPos; }
    public float left() { return this.left; }
    public float right() { return this.right; }
    public float top() { return this.top; }
    public float bottom() { return this.bottom; }
  
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
}
