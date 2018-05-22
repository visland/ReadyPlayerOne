/**
 * Moving objects that will do collision detect.
 */
abstract class CollisionObject extends MovingObject {
  public CollisionObject(float x, float y, float radius) {
    super(x, y);
    collisionRadius = radius;
  }
  
 /**
   * Determines if tow objects are collided.
   *
   * @para other
   *       another object that needed to do collision detection.
   *
   * Returns {true} if two objects are collided.
   */
  public boolean isCollision(CollisionObject other) {
    return getDistance(other) < this.collisionRadius + other.collisionRadius;
  }

  private float collisionRadius;
}