public static class Dimen {

    public static final PVector[] resolutions = {
        new PVector(1280, 720),
        new PVector(1366, 768),
        new PVector(1600, 900),
        new PVector(1920, 1080),
        new PVector(2560, 1440),
        new PVector(3840, 2160)
    };

    public static ArrayList<PVector> availableResolutions = new ArrayList<PVector>();

    public static float gameWidth = 1280;
    public static float gameHeight = 1280;

    public static final int baseWidth = 1280;

    public static final int baseHeight = 720;

    public static final int vertexDim = 50;
    public static final int vertexBuffer = 75;
    public static final int vertexRadius = 25;

    public static final int gameAreaStart = 30;
    public static final int gameBuffer = gameAreaStart + vertexRadius;

    public static final int headingTextSize = 64;
    public static final int menuTextSize = 24;

    public static final float menuWidth = 500;
    public static final float menuHeight = 50;
}