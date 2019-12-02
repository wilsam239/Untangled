static class Mouse {
    
    public static IntList buttons = new IntList();

    public static float x = 0.0;
    public static float y = 0.0;

}

void mousePressed(MouseEvent event) {
    Mouse.buttons.append(event.getButton());
}

void mouseReleased(MouseEvent event) {
    for (int i = Mouse.buttons.size() - 1; i >= 0; i--) {
        if (Mouse.buttons.get(i) == event.getButton())  Mouse.buttons.remove(i);
    }
}