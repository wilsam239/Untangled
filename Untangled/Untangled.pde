Game game;

public static int FRAMERATE = 60;
public static int WIDTH = 1280;
public static int HEIGHT = 720;

public PImage backgroundImage;
public int cols;
public int rows;
void setup() {
    size(1280,720);
    frameRate(Untangled.FRAMERATE);
    backgroundImage = loadImage("GameBackground.jpg");
    backgroundImage.resize(0,100);
    cols = width/backgroundImage.width;
    rows = height/backgroundImage.height;
    if(width%backgroundImage.width> 0){cols++;}
    if(height%backgroundImage.height > 0){rows++;}
    noStroke();
    fill(102);

    game = new Game(1280, 720);
}

void draw() {
    for (int y=0; y<rows; y++){
        for (int x=0; x<cols; x++){
          image(backgroundImage,x*backgroundImage.width,y*backgroundImage.height);
        }
      }
    //background(Colours.background);
    
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
