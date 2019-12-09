public static class Colour {
    public int R, G, B, A;

    Colour(int black) {
        this.R = black;
        this.G = black;
        this.B = black;
        this.A = 255;        
    }

    Colour(int red, int green, int blue) {
        this.R = red;
        this.G = green;
        this.B = blue;
        this.A = 255;
    }

    Colour(int red, int green, int blue, int alpha) {
        this.R = red;
        this.G = green;
        this.B = blue;
        this.A = alpha;
    }
}