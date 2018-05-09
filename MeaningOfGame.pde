final class MeaningOfGame extends GameSystem {
  @Override
  public void setup() {
    initBackground();
    refreshGame();
  }

  @Override
  public void run() {
    background(Const.WHITE);
    if (showBeginPrompt()) return;
    key.display();
    player.display();      
    for (Snack snack : snacks) {
      snack.display();
    }
    if (showFailPrompt()) return;
    if (succeed()) {
      image(win, width / 2, height / 2);
      if (keyInput.isSpacePressed) {
        changePage(Const.HALL);
        addPassedRoom();
      }
      return;  // Do NOT execute below code when the player wins.
    }
    key.update();
    player.update();
    for (int i = snacks.size() - 1; i >= 0; -- i) {
      if (player.isCollision(snacks.get(i))) {
        snacks.remove(i);
      }
    }
    fail = fail();
  }

  // Initializes player's position.
  private void initPlayerPosition() {
    float radius = (Const.KEY_INNER_RADIUS + Const.KEY_OUTER_RADIUS) / 2;
    double movingDirection = key.getMovingDirection();
    player.x = (float) (key.x - radius * Math.cos(movingDirection));
    player.y = (float) (key.y + radius * -Math.sin(movingDirection));
  }

  // Resets key and player.
  @Override
  protected void refreshGame() {
    // Initializes key position
    key.x = width / 2;
    key.y = height / 2;
    initPlayerPosition();
    initSnacks();
  }

  private boolean fail() {
    return (player.isCollision(key) && !snacks.isEmpty()) ||
           player.getDistance(key) >= Const.KEY_OUTER_RADIUS - Const.PLAYER_COLLISION_RADIUS;
  }

  private boolean succeed() {
    return player.isCollision(key) && snacks.isEmpty();
  }

  private void initBackground() {
    println("hi");
    instruction = loadImage("img/instruction2.png");
    win = loadImage("img/win2.png");
  }

  private void initSnacks() {
    // Initializes snacks
    snacks.clear();
    for (int i = 0; i < SNACK_SZ; ++i) {
      snacks.add(new Snack(random(Const.KEY_OUTER_RADIUS, width - Const.KEY_OUTER_RADIUS), 
                           random(Const.KEY_OUTER_RADIUS, height - Const.KEY_OUTER_RADIUS)));
    }
  }

  private Key key = new Key(0, 0);
  private KeyChaser player = new KeyChaser();
  private static final int SNACK_SZ = 3;
  private ArrayList<Snack> snacks = new ArrayList<Snack>();
}

/**
 * The moving key in game 3.
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

/**
 * The player in game 3.
 */
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

/**
 * Snacks in game 3.
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