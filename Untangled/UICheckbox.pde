class UICheckbox extends UIButton {

    public UICheckbox() { }

    public UICheckbox(float left, float top, float size) {
        this.left = left;
        this.top = top;
        this.right = this.left + size;
        this.bottom = this.top + size;
    }

    public void draw() {
        super.draw();
        fill(156, 156, 156, this.hoverTimer);
        
        stroke(128, 128, 128);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }



}