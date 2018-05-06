package hall;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;
import utils.KeyInput;
import utils.MovingObject;

public class Hall extends GameSystem {
  public Hall(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
    // Draws first game and its door
    // TODO: change them to pictures of house.
    g.rect(300, 200, 150, 440);
    g.rect(350, 540, 40, 100);
    // Draws second game and its door
    g.rect(550, 200, 150, 440);
    g.rect(600, 540, 40, 100);
    // Draws third game and its door
    g.rect(800, 200, 150, 440);
    g.rect(850, 540, 40, 100);
    player.update();
    player.display(g);
    if (KeyInput.isUpPressed) {
      if (MovingObject.x > 350 && MovingObject.x < 390) {
        g.changePage(1);
      } else if (MovingObject.x > 600 && MovingObject.x < 640) {
        g.changePage(2);
      } else if (MovingObject.x > 850 && MovingObject.x < 890) {
        g.changePage(3);
      }
    }
  }

  private int START_X = 150;
  private int START_Y = 600;
  HallPlayer player = new HallPlayer(START_X, START_Y);
}
