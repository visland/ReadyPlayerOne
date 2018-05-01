package utils;

import processing.core.PApplet;

public class KeyInput {
  /**
   * @param pressed
   *          equals true when a specific key is pressed, false when it is
   *          released.
   */
  public static void update(char key, int keyCode, boolean pressed) {
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
    }
  }

  public static boolean isUpPressed = false;
  public static boolean isDownPressed = false;
  public static boolean isLeftPressed = false;
  public static boolean isRightPressed = false;
  public static boolean isSpacePressed = false;
}
