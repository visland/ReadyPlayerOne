package utils;

import processing.core.PApplet;

public abstract class MovingObject {
  public MovingObject(float _x, float _y) {
    x = _x;
    y = _y;
  }

  public float getDistance(MovingObject other) {
    return PApplet.dist(x, y, other.x, other.y);
  }

  public abstract void update();

  public abstract void display(PApplet g);

  protected void updateX() {
    if (KeyInput.isLeftPressed) {
      x -= velocity;
    } else if (KeyInput.isRightPressed) {
      x += velocity;
    }
    // Ensures the player is within the screen.
    x = Math.max(0, Math.min(Const.WIDTH, x));
  }

  protected void updateY() {
    if (KeyInput.isUpPressed) {
      y -= velocity;
    } else if (KeyInput.isDownPressed) {
      y += velocity;
    }
    // Makes sure the player is always in the screen.
    y = Math.max(0, Math.min(Const.HEIGHT, y));
  }

  public float x;
  public float y;
  protected float velocity = (float) 2.5;
}
