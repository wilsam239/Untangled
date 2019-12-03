Game game;

public static int FRAMERATE = 60;
public static int WIDTH = 1280;
public static int HEIGHT = 720;

void setup() {
    size(1280,720);
    frameRate(Untangled.FRAMERATE);
    background(Colours.background);
    noStroke();
    fill(102);

    game = new Game(1280, 720);
}

void draw() {
    background(Colours.background);
    
    game.run();

    drawDebug();

    // Clear the current mouse presses so that they are only triggered for one frame.
    Mouse.clearBuffers();
}

void drawDebug() {
    fill(255, 0, 0);
    for(int i = 0; i < Mouse.buttons.size(); i++) {
        text(Mouse.buttons.get(i), 100, 100 + 10 * i);
    }
    for(int i = 0; i < Mouse.btnPressed.size(); i++) {
        text(Mouse.btnPressed.get(i), 150, 100 + 10 * i);
    }
    for(int i = 0; i < Mouse.btnReleased.size(); i++) {
        text(Mouse.btnReleased.get(i), 180, 100 + 10 * i);
    }
    
}
