class Edge {
    Vertex startVertex, endVertex;
    float xPosStart, yPosStart, xPosEnd, yPosEnd;

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

        this.xPosStart = start.x() + Dimen.vertexDim/2;
        this.yPosStart = start.y() + Dimen.vertexDim/2;

        this.xPosEnd = end.x() + Dimen.vertexDim/2;
        this.yPosEnd = end.y() + Dimen.vertexDim/2;
    }

    public void draw() {
        stroke(Colours.edgeStroke);
        line(this.xPosStart, this.yPosStart, this.xPosEnd, this.yPosEnd);
    }

}