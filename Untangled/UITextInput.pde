public class UITextInput extends UIButton {

    private boolean focused = false;
    private String input = "";

    private int pipeTimer = 0;

    private boolean submitted = false;

    // Default constructor
    public UITextInput() { }

    public void update() {
        super.update();

        if (!hover() && Mouse.btnPressed.hasValue(Mouse.LEFT)) this.focused = false;

        if (this.focused) {
            if (Keyboard.keys.hasValue(Keyboard.ENTER)) this.submit();
            this.captureText();
            this.hoverTimer = 255;
        } else {
            this.hoverTimer = 0;
            return;
        }

        pipeTimer++;
        if (pipeTimer < 60) {
            this.text = input + "|";
        } else if (pipeTimer < 120) {
            this.text = input;
        } else pipeTimer = 0;
    }

    @Override
    protected void onClick() {
        this.focused = true;
    }

    private void captureText() {
        if (this.submitted) return;
        if (this.handler == null) {
            println("WARNING: Input handler not set!");
            return;
        }

        if (Keyboard.keyPressed.hasValue(Keyboard.DELETE)) {
            if (this.input.length() > 0) this.input = this.input.substring(0, this.input.length() - 1);
            return;
        }

        boolean shift = Keyboard.keys.hasValue(Keyboard.SHIFT);

        for (int i : Keyboard.keyPressed) {
            if (i < 65 || i > 90) continue;
            String c = str(char(i));
            if (!shift) c = c.toLowerCase();
            this.input += c;
        }
    }

    @Override
    protected void entered() {
        cursor(TEXT);
    }

    public void submit() {
        this.submitted = true;
        this.onSubmit();
    }

    // Override this!
    protected void onSubmit(){
        println("WARNING: UITextInput.onSubmit() should be defined on a per-instance basis!");
    }

    public String getInput() {
        return this.input;
    }

    @Override
    public void draw() {
        stroke(Colours.waterfall.R, Colours.waterfall.G, Colours.waterfall.B);
        super.draw();
    }



}