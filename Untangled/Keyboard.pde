static class Keyboard {
    
    public static final int SHIFT = 16;
    public static final int ENTER = 13;
    public static final int DELETE = 8;

    public static IntList keys = new IntList();

    public static IntList keyPressed = new IntList();
    public static IntList keyReleased = new IntList();

    // Clear all the key press events.
    public static void clearBuffers() {
        Keyboard.keyPressed.clear();
        Keyboard.keyReleased.clear();
    }

    // For UIButtons
    public static UIButton clickedButton = null;
}

void keyPressed(KeyEvent event) {
    if (Keyboard.keys.hasValue(event.getKeyCode())) {
        key = 0;
        return;
    }
    Keyboard.keys.append(event.getKeyCode());
    Keyboard.keyPressed.append(event.getKeyCode());
    
    // Prevent any default actions
    key = 0;
}

void keyReleased(KeyEvent event) {
    for (int i = Keyboard.keys.size() - 1; i >= 0; i--) {
        if (Keyboard.keys.get(i) == event.getKeyCode()) {
            Keyboard.keys.remove(i);
            Keyboard.keyReleased.append(event.getKeyCode());
        }
    }
}