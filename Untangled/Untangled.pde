UIButton b;
UIButton b2;

Level l = new Level();

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

    drawDebug();
}

void drawDebug() {
    for(int i = 0; i < Mouse.buttons.size(); i++) {
        text(Mouse.buttons.get(i), 100, 100 + 10 * i);
    }
}
