package utils;

public abstract class CollisionObject extends MovingObject {
  public CollisionObject(float x, float y, float radius) {
    super(x, y);
    collisionRadius = radius;
  }

  public boolean isCollision(CollisionObject other) {
    return getDistance(other) < this.collisionRadius + other.collisionRadius;
  }

  private float collisionRadius;
}
