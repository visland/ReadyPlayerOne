package hall;

import processing.core.PApplet;
import utils.Const;
import utils.KeyInput;
import utils.MovingObject;

public class HallPlayer extends MovingObject {
  public HallPlayer(float _x, float _y) {
    super(_x, _y);
  }

  @Override
  public void update() {
    if (KeyInput.isLeftPressed) {
      x -= VELOCITY;
    } else if (KeyInput.isRightPressed) {
      x += VELOCITY;
    }
    // Makes sure x is always in the screen.
    x = Math.max(0, Math.min(Const.WIDTH, x));
  }

  @Override
  public void display(PApplet g) {
    // TODO: change it to a picture of the player.
    g.ellipse(x, y, 20, 80);
  }
}
