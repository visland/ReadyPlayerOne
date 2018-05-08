final class MeaningOfGame extends GameSystem {
  public void setup() {
    initBackground();
    refreshGame();
  }

  public void run() {
    background(Const.WHITE);
    if (!gameBegun) {
      image(instruction, width / 2, height / 2);
      if (keyInput.isSPressed) {
        gameBegun = true;
      }
    } else {
      key.update();
      key.display();
      player.update();
      player.display();
      if (fail()) {
        refreshGame();
      }
    }
  }

  // Initializes player's position.
  private void initPlayerPosition() {
    float radius = (Const.KEY_INNER_RADIUS + Const.KEY_OUTER_RADIUS) / 2;
    double movingDirection = key.getMovingDirection();
    player.x = (float) (key.x - radius * Math.cos(movingDirection));
    player.y = (float) (key.y + radius * -Math.sin(movingDirection));
  }

  // Resets key and player.
  private void refreshGame() {
    key.x = width / 2;
    key.y = height / 2;
    initPlayerPosition();
  }

  private boolean fail() {
    return player.isCollision(key)
      || player.getDistance(key) >= Const.KEY_OUTER_RADIUS - Const.PLAYER_COLLISION_RADIUS;
  }

  public void initBackground() {
    instruction = loadImage("img/instruction2.png");
    win = loadImage("img/win2.png");
  }

  Key key = new Key(0, 0);
  KeyChaser player = new KeyChaser();
  private boolean gameBegun = false;
}