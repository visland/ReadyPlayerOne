/**
 * The game hall where player can access to three different games.
 */
class Hall extends GameSystem {
  @Override
  public void setup() {
    initSound();
    initBackground();
  }
  
  @Override
  public void run() {
    image(bg, width / 2, height / 2);
    // Determines if the player enters a room successfully.
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
  
  @Override
  protected boolean fail() { return false; }
  
  @Override
  protected boolean succeed() { return false; }
  
  @Override
  protected void display() {}
  
  @Override
  protected void update() {}

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
  
  public void initSound() {
    minim = new Minim(this);
    bgMusic = minim.loadFile("hall.mp3");
  }
  
  protected AudioPlayer bgMusic;
  protected Minim minim;
  private PImage bg;
  private PImage worngRoom;
  private int START_X = 129;
  private int START_Y = 560;
  private HallPlayer player = new HallPlayer(START_X, START_Y);
}

/**
 * The player in the main hall.
 */
public class HallPlayer extends MovingObject {
  public HallPlayer(float _x, float _y) {
    super(_x, _y);
  }

  @Override
  public void update() {
    updateX();
  }

  @Override
  public void display() {
    // Display left and right sides of the player.
    if (keyInput.isLeftPressed) {
      image(leftPlayer, x, y, 98, 135);
    } else {
      image(rightPlayer, x, y, 98, 135);
    }
  }

  public void loadHallPlayer() {
    leftPlayer = loadImage("img/left.png");
    rightPlayer = loadImage("img/right.png");
  }

  private PImage leftPlayer;
  private PImage rightPlayer;
}