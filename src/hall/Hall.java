package hall;

import main.ReadyPlayerOne;
import processing.core.PImage;
import utils.GameSystem;
import utils.KeyInput;

public class Hall extends GameSystem {
  public Hall(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.image(bg, utils.Const.WIDTH / 2, utils.Const.HEIGHT / 2);
    if (KeyInput.isUpPressed) {
      if (inHouse1()) {
        g.changePage(utils.Const.CAR_RACING);
      } else if (inHouse2() && g.getPassedRoom() >= 1) {
        g.changePage(utils.Const.SAVE_KIRA);
      } else if (inHouse3() && g.getPassedRoom()  >= 2) {
        g.changePage(utils.Const.MEANING_OF_GAME);
      } else if ((inHouse2() && g.getPassedRoom()  < 1)
          || inHouse3() && g.getPassedRoom()  < 2) {
        g.image(worngRoom, utils.Const.WIDTH / 2, utils.Const.HEIGHT / 2);
      }
    }
    player.update();
    player.display(g);
  }

  private boolean inHouse1() {
    return player.x > 320 && player.x < 430;
  }

  private boolean inHouse2() {
    return player.x > 580 && player.x < 690;
  }

  private boolean inHouse3() {
    return player.x > 835 && player.x < 995;
  }

  public void initBackground() {
    bg = g.loadImage("hall.jpg");
    player.loadHallPlayer(g);
    worngRoom = g.loadImage("wrongroom.png");
  }

  private PImage bg;
  private PImage worngRoom;
  private int START_X = 129;
  private int START_Y = 560;
  private HallPlayer player = new HallPlayer(START_X, START_Y);
}
