package game2;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;

public class SaveKira extends GameSystem {
  public SaveKira(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
  }

}