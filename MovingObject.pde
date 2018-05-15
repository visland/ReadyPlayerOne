abstract class MovingObject {
  public MovingObject(float _x, float _y) {
    x = _x;
    y = _y;
  }

  public float getDistance(MovingObject other) {
    return PApplet.dist(x, y, other.x, other.y);
  }

  public abstract void update();

  public abstract void display();

  protected void updateX() {
    if (keyInput.isLeftPressed) {
      x -= velocity;
    } else if (keyInput.isRightPressed) {
      x += velocity;
    }
    // Ensures the player is within the screen.
    x = Math.max(0, Math.min(width, x));
  }

  protected void updateY() {
    if (keyInput.isUpPressed) {
      y -= velocity;
    } else if (keyInput.isDownPressed) {
      y += velocity;
    }
    // Makes sure the player is always in the screen.
    y = Math.max(0, Math.min(height, y));
  }

  public float x;
  public float y;
  protected float velocity = (float) 3.2;
}