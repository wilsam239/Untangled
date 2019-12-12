class UICheckbox extends UIButton {

    public boolean checked = false;

    public UICheckbox() { }

    public UICheckbox(float x, float y, float size) {
        this.setLocationAndSize(x, y, size, size);
    }

    @Override
    protected void onClick() {
        this.checked = !this.checked;

        if (this.checked) this.onCheck();
        else this.onUnCheck();
    }

    protected void onCheck() {
        println("WARNING: UIcheckbox.onCheck() is not defined! It should be defined on a per-instance basis!");
    }

    protected void onUnCheck() {
        println("WARNING: UIcheckbox.onUnCheck() is not defined! It should be defined on a per-instance basis!");
    }

    public void draw() {
        super.draw();
        if (!this.checked) fill(156, 156, 156, this.hoverTimer);
        else fill(255, 156, 156, 255 - this.hoverTimer);

        stroke(128, 128, 128);
        rect(this.x(), this.y(), this.width(), this.height());
    }



}