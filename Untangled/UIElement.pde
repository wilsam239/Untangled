abstract class UIElement {
    
    public float top, bottom, left, right;

    // ----- ALIGNMENT -----

    public void alignToptoTopOf(UIElement e) {
        this.top = e.top;
    }

    public void alignToptoBottomOf(UIElement e) {
        this.top = e.bottom;
    }

    public void alignBottomtoTopOf(UIElement e) {
        this.bottom = e.top;
    }

    public void alignBottomtoBottomOf(UIElement e) {
        this.bottom = e.bottom;
    }

    public void alignLeftToLeftOf(UIElement e) {
        this.left = e.left;
    }

    public void alignLeftToRightOf(UIElement e) {
        this.left = e.right;
    }

    public void alignRightToLeftOf(UIElement e) {
        this.right = e.left;
    }

    public void alignRightToRightOf(UIElement e) {
        this.right = e.right;
    }

}