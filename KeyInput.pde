class KeyInput {
  /**
   * @param pressed
   *        equals true when a specific key is pressed, false when it is released.
   */
  public void update(char key, int keyCode, boolean pressed) {
    switch (keyCode) {
      case PApplet.UP:
        isUpPressed = pressed;
        return;
      case PApplet.DOWN:
        isDownPressed = pressed;
        return;
      case PApplet.LEFT:
        isLeftPressed = pressed;
        return;
      case PApplet.RIGHT:
        isRightPressed = pressed;
        return;
    }
    if (key == ' ') {
      isSpacePressed = pressed;
    } else if (key == 'r') {
      isRPressed = pressed;
    } else if (key == 's') {
      isSPressed = pressed;
    }
  }

  public boolean isSPressed = false;
  public boolean isRPressed = false;
  public boolean isUpPressed = false;
  public boolean isDownPressed = false;
  public boolean isLeftPressed = false;
  public boolean isRightPressed = false;
  public boolean isSpacePressed = false;
}