package utils;

import main.ReadyPlayerOne;

public abstract class GameSystem {
  public ReadyPlayerOne g;

  public GameSystem(ReadyPlayerOne _g) {
    g = _g;
  }
  
  abstract public void run();
}
