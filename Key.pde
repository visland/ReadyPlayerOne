/**
 * The moving key in the game 3.
 */
final class Key extends CollisionObject {
  public Key(float x, float y) {
    super(x, y, Const.KEY_COLLISION_RADIUS);
    velocity = 2;
  }

  @Override
  public void update() {
    x += velocity * Math.cos(movingDirection);
    y += velocity * -Math.sin(movingDirection);
  }

  @Override
  public void display() {
    fill(0, 0);
    ellipse(x, y, 2 * Const.KEY_INNER_RADIUS, 2 * Const.KEY_INNER_RADIUS);
    ellipse(x, y, 2 * Const.KEY_OUTER_RADIUS, 2 * Const.KEY_OUTER_RADIUS);
    updateMovingDirection();
  }

  private void updateMovingDirection() {
    if (y - Const.KEY_OUTER_RADIUS <= 0 || y + Const.KEY_OUTER_RADIUS > height) {
      // Hits the top or bottom
      movingDirection = -movingDirection;
    } else if (x - Const.KEY_OUTER_RADIUS < 0 || x + Const.KEY_OUTER_RADIUS > width) {
      // Hits the left or right.
      movingDirection = Math.PI - movingDirection;
    }
  }
  
  public double getMovingDirection() {
    return movingDirection;
  }

  private double movingDirection = Math.PI * .6;
}