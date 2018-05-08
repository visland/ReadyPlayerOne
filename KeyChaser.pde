final class KeyChaser extends CollisionObject {
  public KeyChaser() {
    super(0, 0, Const.PLAYER_COLLISION_RADIUS);    
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display() {
    fill(200, 0, 0);
    ellipse(x, y, Const.PLAYER_COLLISION_RADIUS * 2, Const.PLAYER_COLLISION_RADIUS * 2);
  }
}