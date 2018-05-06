package hall;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;
import utils.MovingObject;

public class Hall extends GameSystem {
  public Hall(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
    house.drawHouse(g);
    player.update();
    player.display(g);
    house.inHouse(MovingObject.x, g);
  }

  private int START_X = 150;
  private int START_Y = 600;
  HallPlayer player = new HallPlayer(START_X, START_Y);
  HallHouse house = new HallHouse();
}
