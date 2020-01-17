public static class Dimen {

    public static final PVector[] resolutions = {
        new PVector(1280, 720),
        new PVector(1366, 768),
        new PVector(1600, 900),
        new PVector(1920, 1080),
        new PVector(2560, 1440),
        new PVector(3840, 2160)
    };

    public static int currentResolution = 0;
    
    public static PVector currentSize() {
        return Dimen.resolutions[Dimen.currentResolution];
    }
    public static int currentSizeX() {
        return int(Dimen.currentSize().x);
    }
    public static int currentSizeY() {
        return int(Dimen.currentSize().y);
    }

    public static ArrayList<PVector> availableResolutions = new ArrayList<PVector>();

    // The base rololution the the games UI was designed with.
    public static final int baseWidth = 1280;
    public static final int baseHeight = 720;

    // The user selected resolution to run the game at.
    public static float gameWidth = 1280;
    public static float gameHeight = 720;

    // The ratio between the base resolution and the selected resolution.
    public static float displayRatio() {
        return Dimen.resolutions[Dimen.currentResolution].x / Dimen.baseWidth;
    }

    // DON'T REFERENCE THESE OUTSIDE THIS CLASS!
    private static final int vertexDim = 50;
    private static final int vertexBuffer = 75;
    private static final int vertexRadius = 25;

    private static final int gameAreaStart = 30;
    private static final int gameBuffer = gameAreaStart + vertexRadius;

    private static final int headingTextSize = 64;
    private static final int menuTextSize = 24;

    private static final float menuWidth = 500;
    private static final float menuHeight = 50;

    // REFERENCE THESE INSTEAD!
    // Functions for returning the scaled dimens.
    public static float vertexDim() {
        return Dimen.vertexDim * Dimen.displayRatio();
    }
    public static float vertexBuffer() {
        return Dimen.vertexBuffer * Dimen.displayRatio();
    }
    public static float vertexRadius() {
        return Dimen.vertexRadius * Dimen.displayRatio();
    }

    public static float gameAreaStart() {
        return Dimen.gameAreaStart * Dimen.displayRatio();
    }
    public static float gameBuffer() {
        return Dimen.gameBuffer * Dimen.displayRatio();
    }

    public static float headingTextSize() {
        return Dimen.headingTextSize * Dimen.displayRatio();
    }
    public static float menuTextSize() {
        return Dimen.menuTextSize * Dimen.displayRatio();
    }

    public static float menuWidth() {
        return Dimen.menuWidth * Dimen.displayRatio();
    }
    public static float menuHeight() {
        return Dimen.menuHeight * Dimen.displayRatio();
    }

    
}