Game game;

public static int FRAMERATE = 60;


public PImage backgroundImage;
PImage icon;
public int cols;
public int rows;
void setup() {
    size(1280,720);
    frameRate(Untangled.FRAMERATE);

    icon = loadImage("icon.png");
    surface.setIcon(icon);

    backgroundImage = loadImage("GameBackground.png");

    Resources.gentleTouch = createFont("AGentleTouch.ttf", 32);

    noStroke();
    fill(102);

    game = new Game(Dimen.baseWidth, Dimen.baseHeight);
}

void draw() {

    image(backgroundImage, 0, 0, Dimen.currentSizeX(), Dimen.currentSizeY());
    //background(Colours.background);
    
    game.run();

    drawDebug();

    // Clear the current mouse presses so that they are only triggered for one frame.
    Mouse.clearBuffers();
    Keyboard.clearBuffers();
}

void drawDebug() {
    fill(255, 0, 0);
    textSize(10);
    for(int i = 0; i < Mouse.buttons.size(); i++) {
        text(Mouse.buttons.get(i), 100, 100 + 10 * i);
    }
    for(int i = 0; i < Mouse.btnPressed.size(); i++) {
        text(Mouse.btnPressed.get(i), 150, 100 + 10 * i);
    }
    for(int i = 0; i < Mouse.btnReleased.size(); i++) {
        text(Mouse.btnReleased.get(i), 180, 100 + 10 * i);
    }

    // Keyboard
    for(int i = 0; i < Keyboard.keys.size(); i++) {
        text(Keyboard.keys.get(i), 200, 100 + 20 * i);
    }
    
}
