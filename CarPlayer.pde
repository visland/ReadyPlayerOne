public class CarPlayer extends CollisionObject {
  public CarPlayer(float x, float y) {
    super(x, y, Const.PLAYER_COLLISION_RADIUS);
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display() {
    g.rect(x, y, 30, 30);
  }

  public void reset() {
    x = width / 2;
    y = height / 2;
  }
}