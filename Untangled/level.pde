class Level extends LevelInterface {
    // Random Level Constructor
    Level() {
        // If no parameters, generate a new blank level
        for (int i = 0; i < 10; i++) {
            vertices.add(new Vertex(random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer), random(Dimen.vertexBuffer,Dimen.gameHeight - Dimen.vertexBuffer)));
            if(i % 2 != 0) {
                edges.add(new Edge(vertices.get(i), vertices.get(i-1)));
            }
        }
    }

    // Loaded Level Constructor
    Level(ArrayList<Vertex> vertices, ArrayList<Edge> edges) {
        this.vertices = vertices;
        this.edges = edges;
    }
}
