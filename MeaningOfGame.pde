final class MeaningOfGame extends GameSystem {
  @Override
  public void setup() {
    initBackground();
    for (int i = 0; i < SNACK_IMGS.length; i++) {
      SNACK_IMGS[i] = loadImage("img/game3/" + i + ".png");
    }
    refreshGame();
    key.setup();
    player.setup();
  }

  // Initializes player's position.
  private void initPlayerPosition() {
    float radius = (Const.KEY_INNER_RADIUS + Const.KEY_OUTER_RADIUS) / 2;
    double movingDirection = key.getMovingDirection();
    player.x = (float) (key.x - radius * Math.cos(movingDirection));
    player.y = (float) (key.y + radius * -Math.sin(movingDirection));
  }

  // Resets key, player and snacks.
  @Override
  protected void refreshGame() {
    // Initializes key position
    key.x = width / 2;
    key.y = height / 2;
    initPlayerPosition();
    initSnacks();
  }

  @Override
  protected boolean fail() {
    return (player.isCollision(key) && !snacks.isEmpty()) ||
           player.getDistance(key) >= Const.KEY_OUTER_RADIUS - Const.PLAYER_COLLISION_RADIUS;
  }

  @Override
  protected boolean succeed() {
    return player.isCollision(key) && snacks.isEmpty();
  }
  
  @Override
  protected void display() {
    image(background, width / 2, height / 2);
    for (Snack snack : snacks) {
      snack.display();
    }
    key.display();
    player.display();      
  }

  @Override
  protected void update() {
    key.update();
    player.update();
    for (int i = snacks.size() - 1; i >= 0; -- i) {
      if (player.isCollision(snacks.get(i))) {
        snacks.remove(i);
      }
    }
  }

  public void initBackground() {
    instruction = loadImage("img/instruction2.png");
    win = loadImage("img/win2.png");
    lose = loadImage("img/lose.png");
    background = loadImage("img/game3/bg.png");
  }

  private void initSnacks() {
    // Initializes snacks
    snacks.clear();
    for (int i = 0; i < SNACK_SZ; i++) {
      snacks.add(new Snack(random(Const.SNACK_COLLISION_RADIUS + 50, width - Const.SNACK_COLLISION_RADIUS - 50), 
                           random(Const.SNACK_COLLISION_RADIUS + 50, height - Const.SNACK_COLLISION_RADIUS - 50), SNACK_IMGS[i]));
    }
  }

  private Key key = new Key(0, 0);
  private KeyChaser player = new KeyChaser();
  private static final int SNACK_SZ = 6;
  private ArrayList<Snack> snacks = new ArrayList<Snack>();
  private PImage[] SNACK_IMGS = new PImage[6];
}

/**
 * The moving key in game 3.
 */
final class Key extends CollisionObject {
  public Key(float x, float y) {
    super(x, y, Const.KEY_COLLISION_RADIUS);
    velocity = 2;
  }
  
  public void setup() {
    keyImg = loadImage("img/game3/key.png");
    circle = loadImage("img/game3/circle.png");
  }

  @Override
  public void update() {
    x += velocity * Math.cos(movingDirection);
    y += velocity * -Math.sin(movingDirection);
  }

  @Override
  public void display() {
    fill(0, 0);
    image(circle, x, y, 2 * Const.KEY_OUTER_RADIUS, 2 * Const.KEY_OUTER_RADIUS);
    image(keyImg, x, y, 2 * Const.KEY_INNER_RADIUS, 2 * Const.KEY_INNER_RADIUS);
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
  private PImage keyImg;
  private PImage circle;
}

/**
 * The player in game 3.
 */
final class KeyChaser extends CollisionObject {
  public KeyChaser() {
    super(0, 0, Const.PLAYER_COLLISION_RADIUS);    
  }
  
  public void setup() {
    chaser = loadImage("img/game3/player.png");
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display() {
    image(chaser, x, y, Const.PLAYER_COLLISION_RADIUS * 2, Const.PLAYER_COLLISION_RADIUS * 2);
  }
  
  private PImage chaser;
}

/**
 * Snacks in game 3.
 */
class Snack extends CollisionObject {
  Snack(float x, float y, PImage _img) {
    super(x, y, Const.SNACK_COLLISION_RADIUS);
    img = _img;
  }

  // Does nothing because snack is NOT supposed to move.
  @Override
  public void update() {}

  @Override
  public void display() {
    image(img, x, y, Const.SNACK_COLLISION_RADIUS * 2, Const.SNACK_COLLISION_RADIUS * 2);
  }

  private PImage img;
}