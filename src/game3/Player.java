package game3;

import processing.core.PApplet;
import utils.CollisionObject;

final public class Player extends CollisionObject {
  public Player() {
    super(0, 0, Const.PLAYER_COLLISION_RADIUS);    
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display(PApplet g) {
    g.fill(200, 0, 0);
    g.ellipse(x, y, Const.PLAYER_COLLISION_RADIUS * 2, Const.PLAYER_COLLISION_RADIUS * 2);
  }
}
