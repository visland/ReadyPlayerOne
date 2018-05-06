package hall;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;

public class Hall extends GameSystem {
  public Hall(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
    for (int i = 0; i < houses.length; i++) {
      houses[i].drawHouse(g);
      if (houses[i].inHouse(g)) {
        g.changePage(i + 1);
      }
    }
    player.update();
    player.display(g);
  }

  private int START_X = 150;
  private int START_Y = 600;
  HallPlayer player = new HallPlayer(START_X, START_Y);
  HallHouse[] houses = new HallHouse[] { new HallHouse(300, 200), new HallHouse(550, 200),
      new HallHouse(800, 200) };
}
