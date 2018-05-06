package utils;

import processing.core.PApplet;

public abstract class MovingObject {
  public MovingObject(float _x, float _y) {
    x = _x;
    y = _y;
  }

  protected float getDistance(MovingObject other) {
    return PApplet.dist(x, y, other.x, other.y);
  }

  public abstract void update();

  public abstract void display(PApplet g);

  public float x;
  public float y;
  public static double VELOCITY = 2.5;
}
