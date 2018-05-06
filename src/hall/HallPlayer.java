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
    System.out.println(x);
    if (KeyInput.isLeftPressed) {
      x -= VELOCITY;
    } else if (KeyInput.isRightPressed) {
      x += VELOCITY;
    }
    if (x >= Const.WIDTH) {
      x -= VELOCITY;
    } else if (x <= 0) {
      x += VELOCITY;
    }
  }

  @Override
  public void display(PApplet g) {
    // TODO: change it to a picture of the player.
    g.ellipse(x, y, 20, 80);
  }
}
