package game1;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;

public class CarRacing extends GameSystem {
  public CarRacing(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.BLACK);
  }

}
