import java.util.UUID;

class LevelIO {

    public PrintWriter output;

    public LevelIO () { }

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

    public Level loadLevelFromFile() {
        return null;
    }

}