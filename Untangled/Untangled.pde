UIButton b;

Level l = new Level();

void setup() {
    size(1280,720);
    background(Colours.background);
    noStroke();
    fill(102);

    b = new UIButton();
}

void draw() {
    b.draw();
    l.draw();  
}
