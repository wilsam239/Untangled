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

    // Returns true if this edge intersects the given edge.
    public boolean intersects(Edge e) {
        if (this.getStart() == e.getStart()
            || this.getStart() == e.getEnd()
            || this.getEnd() == e.getStart()
            || this.getEnd() == e.getEnd()) return false;

        float x1 = this.getStart().x();
        float x2 = this.getEnd().x();
        float x3 = e.getStart().x();
        float x4 = e.getEnd().x();

        float y1 = this.getStart().y();
        float y2 = this.getEnd().y();
        float y3 = e.getStart().y();
        float y4 = e.getEnd().y();

        float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

        float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

        // The lines intersect if both uA & uB are within 0-1
        if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
            //float intersectionX = x1 + (uA * (x2-x1));
            //float intersectionY = y1 + (uA * (y2-y1));
            
            return true;
        }
        return false;
    }

    // Returns true if this edge intersects any of the given edges.
    public boolean intersectsAny(ArrayList<Edge> edges) {
        for (Edge e : edges) {
            if (this.intersects(e)) return true;
        }
        return false;
    }

    // Returns true if this edge is a duplcate of the given edge.
    public boolean isDuplicateOf(Edge e) {
        if (this.getStart() == e.getStart() && this.getEnd() == e.getEnd()) return true;
        if (this.getStart() == e.getEnd() && this.getEnd() == e.getStart()) return true;
        return false;
    }

    // Returns true if this edge is a duplicate of any of the given edges.
    public boolean isDuplicateOfAny(ArrayList<Edge> edges) {
        for (Edge e : edges) {
            if (this.isDuplicateOf(e)) return true;
        }
        return false;
    }
}