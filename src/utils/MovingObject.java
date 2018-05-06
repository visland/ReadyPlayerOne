package utils;

import processing.core.PApplet;

public abstract class MovingObject{
  public MovingObject(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  public abstract void update();
  public abstract void display(PApplet g);
  
  public static float x;
  public static float y;
  public static double VELOCITY = 2.5;
}
