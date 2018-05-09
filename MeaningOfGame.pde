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
