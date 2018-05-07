package hall;

import processing.core.PApplet;
import processing.core.PImage;
import utils.KeyInput;
import utils.MovingObject;

public class HallPlayer extends MovingObject {
  public HallPlayer(float _x, float _y) {
    super(_x, _y);

  }

  @Override
  public void update() {
    updateX();
  }

  @Override
  public void display(PApplet g) {
    if (KeyInput.isLeftPressed) {
      g.image(leftPlayer, x, y, 98, 135);
    } else {
      g.image(rightPlayer, x, y, 98, 135);
    }
  }

  public void loadHallPlayer(PApplet g) {
    leftPlayer = g.loadImage("left.png");
    rightPlayer = g.loadImage("right.png");
  }

  private PImage leftPlayer;
  private PImage rightPlayer;
}
