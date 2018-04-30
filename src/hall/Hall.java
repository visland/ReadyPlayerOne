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
    g.background(Const.BLACK);
    g.ellipse(Const.WIDTH / 2, Const.HEIGHT / 2, 100, 100);
  }
}
