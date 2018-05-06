package game3;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;

public class MeaningOfGame extends GameSystem {
  public MeaningOfGame(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
  }

}
