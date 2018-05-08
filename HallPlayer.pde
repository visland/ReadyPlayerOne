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