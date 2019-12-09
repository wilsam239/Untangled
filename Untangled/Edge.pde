/**
    Edge class
*/

class Edge {
    private Vertex startVertex, endVertex;
    public boolean intersecting = false;

    Edge() {
        this.startVertex = null;
        this.endVertex = null;
    }

    Edge(Vertex start, Vertex end) {
        this.startVertex = start;
        this.endVertex = end;
    }

    public void draw() {
        if (!this.intersecting) {
            stroke(Colours.edgeStroke);
        } else {
            stroke(Colours.edgeStrokeIntersecting.R, Colours.edgeStrokeIntersecting.G, Colours.edgeStrokeIntersecting.B);
        }
        line(this.startVertex.x(), this.startVertex.y(), this.endVertex.x(), this.endVertex.y());
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

    public boolean intersecting() {
        return this.intersecting;
    }

    public void setIntersecting(boolean i) {
        this.intersecting = i;
    }
}