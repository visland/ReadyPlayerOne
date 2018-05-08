package game2;

import main.ReadyPlayerOne;
import processing.core.PImage;
import utils.Const;
import utils.GameSystem;
import utils.KeyInput;

public class SaveKira extends GameSystem {
  public SaveKira(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
    if (!gameBegan) {
      g.image(instruction, Const.WIDTH / 2, Const.HEIGHT / 2);
      if (KeyInput.isSPressed) {
        gameBegan = true;
      }
    } else {

    }
  }

  public void initBackground() {
    instruction = g.loadImage("instruction3.png");
    win = g.loadImage("win3.png");
  }

  private PImage instruction;
  private PImage win;
  private boolean gameBegan = false;
}