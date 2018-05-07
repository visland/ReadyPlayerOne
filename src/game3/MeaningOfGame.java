package game3;

import main.ReadyPlayerOne;
import utils.GameSystem;

final public class MeaningOfGame extends GameSystem {
  public MeaningOfGame(ReadyPlayerOne g) {
    super(g);
    initPlayerPosition();
  }

  @Override
  public void run() {
    g.background(utils.Const.WHITE);
    key.update();
    key.display(g);
    player.update();
    player.display(g);
    if (fail()) {
      refreshGame();
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
    key.x = utils.Const.WIDTH / 2;
    key.y = utils.Const.HEIGHT / 2;
    initPlayerPosition();
  }

  private boolean fail() {
    return player.isCollision(key)
        || player.getDistance(key) >= Const.KEY_OUTER_RADIUS - Const.PLAYER_COLLISION_RADIUS;
  }

  Key key = new Key(utils.Const.WIDTH / 2, utils.Const.HEIGHT / 2);
  Player player = new Player();
}
