/**
 * Snack in game 3.
 */
class Snack extends CollisionObject {
  Snack(float x, float y) {
    super(x, y, Const.SNACK_COLLISION_RADIUS);
  }

  // Does nothing because snack is NOT supposed to move.
  @Override
  public void update() {}

  @Override
  public void display() {
    fill(#FCFC12);
    ellipse(x, y, Const.SNACK_COLLISION_RADIUS * 2, Const.SNACK_COLLISION_RADIUS * 2);
  }
}
