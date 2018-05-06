package game1;

import processing.core.PApplet;
import utils.CollisionObject;

public class Car extends CollisionObject {
  public Car(float x, float y) {
    super(x, y, Const.CAR_COLLISION_RADIUS);
  }

  @Override
  public void update() {
    x += CAR_VELOCITY;
  }

  @Override
  public void display(PApplet g) {
    g.ellipse(x, y, Const.CAR_WIDTH, Const.CAR_WIDTH);
  }

  private float CAR_VELOCITY = (float) 2.5;
}
