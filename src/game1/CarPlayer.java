package game1;

import processing.core.PApplet;
import utils.CollisionObject;
import utils.Const;

public class CarPlayer extends CollisionObject {
  public CarPlayer(float x, float y) {
    super(x, y, game1.Const.PLAYER_COLLISION_RADIUS);
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display(PApplet g) {
    g.rect(x, y, 30, 30);
  }

  public void reset() {
    x = Const.WIDTH / 2;
    y = Const.HEIGHT / 2;
  }

}
