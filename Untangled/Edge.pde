/**
    Edge class
*/

class Edge {
    Vertex startVertex, endVertex;
    float xPosStart, yPosStart, xPosEnd, yPosEnd;
    public boolean intersecting = false;

    Edge() {
        this.startVertex = null;
        this.endVertex = null;
        this.xPosStart = -1;
        this.yPosStart = -1;
        this.xPosEnd = -1;
        this.yPosEnd = -1;
    }

    Edge(Vertex start, Vertex end) {
        this.startVertex = start;
        this.endVertex = end;

        this.xPosStart = start.x();
        this.yPosStart = start.y();

        this.xPosEnd = end.x();
        this.yPosEnd = end.y();
    }

    public void draw() {
        if (!this.intersecting) {
            stroke(Colours.edgeStroke);
        } else {
            stroke(Colours.edgeStrokeIntersectingR, Colours.edgeStrokeIntersectingG, Colours.edgeStrokeIntersectingB);
        }
        line(this.xPosStart, this.yPosStart, this.xPosEnd, this.yPosEnd);
    }

    public Vertex getStart() {
        return this.startVertex;
    }

    public Vertex getEnd() {
        return this.endVertex;
    }

    public boolean connectedTo(Vertex v) {
        return (this.startVertex == v || this.endVertex == v);
    }

    public void move(float xPos, float yPos, Vertex v) {
        if(v == startVertex) {
            this.xPosStart = xPos;
            this.yPosStart = yPos;
            v.move(xPos, yPos);
        } else if(v == endVertex) {
            this.xPosEnd = xPos;
            this.yPosEnd = yPos;
            v.move(xPos, yPos);
        } else {
            println("Error: No vertex match on that edge.");
        }
    }

    public boolean intersecting() {
        return this.intersecting;
    }

    public void setIntersecting(boolean i) {
        this.intersecting = i;
    }
}