package hall;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;

public class Hall extends GameSystem {
  HallPlayer player = new HallPlayer(20, 20);
  public Hall(ReadyPlayerOne g) {
    super(g);
  }
  
  @Override
  public void run() {
    g.background(Const.WHITE);
    player.update();
    player.display(g);
  }
}
