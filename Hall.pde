class Hall extends GameSystem {
  @Override
  public void setup() {
    initBackground();
  }
  
  @Override
  public void run() {
    image(bg, width / 2, height / 2);
    if (keyInput.isUpPressed) {
      if (inHouse1()) {
        changePage(Const.CAR_RACING);
      } else if (inHouse2() && getPassedRoom() >= 1) {
        changePage(Const.SAVE_KIRA);
      } else if (inHouse3() && getPassedRoom()  >= 2) {
        changePage(Const.MEANING_OF_GAME);
      } else if ((inHouse2() && getPassedRoom()  < 1)
          || inHouse3() && getPassedRoom()  < 2) {
        image(worngRoom, width / 2, height / 2);
      }
    }
    player.update();
    player.display();
  }
  
  @Override
  protected void refreshGame() {}

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
    bg = loadImage("img/hall.jpg");
    player.loadHallPlayer();
    worngRoom = loadImage("img/wrongroom.png");
  }

  private PImage bg;
  private PImage worngRoom;
  private int START_X = 129;
  private int START_Y = 560;
  private HallPlayer player = new HallPlayer(START_X, START_Y);
}
