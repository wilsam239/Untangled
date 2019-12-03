UIButton b;
UIButton b2;

//Level l = new Level();
LevelEditor l = new LevelEditor();

public static final int FRAMERATE = 60;

void setup() {
    size(1280,720);
    frameRate(Untangled.FRAMERATE);
    background(Colours.background);
    noStroke();
    fill(102);

    b = new UIButton();
    b2 = new UIButton(0, 0, 500, 200);
    b2.alignTopToTopOf((UIElement) b);
    b2.alignLeftToRightOf((UIElement) b);

    println(b2.left + ", "+ b2.right + ", "+ b2.top + ", "+ b2.bottom);
}

void draw() {
    background(Colours.background);

    b.update();
    b2.update();

    b.draw();
    b2.draw();
    l.draw();
    l.update();

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
