class Level extends LevelInterface {
    Level() {
        // If no parameters, generate a new blank level
        for (int i = 0; i < 10; i++) {
            vertices.add(new Vertex(random(Dimen.vertexBuffer, Dimen.gameWidth - Dimen.vertexBuffer), random(Dimen.vertexBuffer,Dimen.gameHeight - Dimen.vertexBuffer), this));
            if(i % 2 != 0) {
                edges.add(new Edge(vertices.get(i), vertices.get(i-1)));
            }
        }
    }
}
