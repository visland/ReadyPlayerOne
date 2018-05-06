package game1;

import processing.core.PApplet;
import utils.CollisionObject;
import utils.Const;
import utils.KeyInput;

public class CarPlayer extends CollisionObject {
  public CarPlayer(float x, float y) {
    super(x, y, game1.Const.PLAYER_COLLISION_RADIUS);
  }

  @Override
  public void update() {
    if (KeyInput.isLeftPressed) {
      x -= VELOCITY;
    } else if (KeyInput.isRightPressed) {
      x += VELOCITY;
    }
    if (KeyInput.isUpPressed) {
      y -= VELOCITY;
    } else if (KeyInput.isDownPressed) {
      y += VELOCITY;
    }
    // Makes sure the player is always in the screen.
    x = Math.max(0, Math.min(Const.WIDTH, x));
    y = Math.max(0, Math.min(Const.HEIGHT, y));
  }

  @Override
  public void display(PApplet g) {
    g.rectMode(PApplet.CENTER);
    g.rect(x, y, 30, 30);
  }
  
  public void reset() {
    x = Const.WIDTH / 2;
    y = Const.HEIGHT / 2;
  }

}
