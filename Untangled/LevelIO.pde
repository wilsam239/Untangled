import java.util.UUID;

class LevelIO {

    public PrintWriter output;
    private Game game;

    public LevelIO (Game game) {
        this.game = game;
    }

    public void saveLevelToFile(LevelInterface level) {
        println("No name was given, generating random name");

        // Generate a random UUID for the file name.
        String fileName = "levels/" + UUID.randomUUID().toString() + ".utg";

        this.saveLevelToFile(level, fileName);

    }

    public void saveLevelToFile(LevelInterface level, String fileName) {
        this.output = createWriter(fileName);

        for(Vertex v : level.vertices) {
            this.output.println("v " + v.x() + " " + v.y());
        }
        for(Edge e : level.edges) {
            this.output.println("e " + level.vertices.indexOf(e.getStart()) + " " + level.vertices.indexOf(e.getEnd()));
        }

        // Flush the output and close it.
        this.output.flush();
        this.output.close();
    }

    public Level loadLevelFromFile(String fileName) {
        ArrayList<Vertex> vertices = new ArrayList();
        ArrayList<Edge> edges = new ArrayList();

        String[] lines = loadStrings(fileName);

        for (int i = 0; i < lines.length; i++) {
            String[] params = split(lines[i], " ");

            switch (params[0]) {
                case "v": {
                    Vertex temp = new Vertex(float(params[1]), float(params[2]));
                    vertices.add(temp);
                    break;
                }
                case "e": {
                    Edge temp = new Edge(vertices.get(int(params[1])), vertices.get(int(params[2])));
                    edges.add(temp);
                    break;
                }
            }
        }

        Level level = new Level(vertices, edges, this.game, fileName);
        return level;
    }

}