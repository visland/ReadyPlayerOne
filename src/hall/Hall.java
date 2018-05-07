package hall;

import main.ReadyPlayerOne;
import processing.core.PImage;
import utils.GameSystem;
import utils.KeyInput;

public class Hall extends GameSystem {
  public Hall(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.image(bg, 0, 0);
    if (KeyInput.isUpPressed) {
      if (inHouse1()) {
        g.changePage(1);
      } else if (inHouse2()) {
        g.changePage(2);
      } else if (inHouse3()) {
        g.changePage(3);
      }
    }
    player.update();
    player.display(g);
  }

  private boolean inHouse1() {
    return player.x > 350 && player.x < 400;
  }

  private boolean inHouse2() {
    return player.x > 610 && player.x < 660;
  }

  private boolean inHouse3() {
    return player.x > 865 && player.x < 965;
  }

  public void initBackground() {
    bg = g.loadImage("hall.jpg");
  }

  private PImage bg;
  private int START_X = 150;
  private int START_Y = 600;
  private HallPlayer player = new HallPlayer(START_X, START_Y);
}
