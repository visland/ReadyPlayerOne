package game3;

import main.ReadyPlayerOne;
import processing.core.PImage;
import utils.Const;
import utils.GameSystem;
import utils.KeyInput;

final public class MeaningOfGame extends GameSystem {
  public MeaningOfGame(ReadyPlayerOne g) {
    super(g);
    initPlayerPosition();
  }

  @Override
  public void run() {
    g.background(utils.Const.WHITE);
    if (!gameBegun) {
      g.image(instruction, Const.WIDTH / 2, Const.HEIGHT / 2);
      if (KeyInput.isSPressed) {
        gameBegun = true;
      }
    } else {
      key.update();
      key.display(g);
      player.update();
      player.display(g);
      if (fail()) {
        refreshGame();
      }
    }
  }

  // Initializes player's position.
  private void initPlayerPosition() {
    float radius = (game3.Const.KEY_INNER_RADIUS + game3.Const.KEY_OUTER_RADIUS) / 2;
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
        || player.getDistance(key) >= game3.Const.KEY_OUTER_RADIUS - game3.Const.PLAYER_COLLISION_RADIUS;
  }

  public void initBackground() {
    instruction = g.loadImage("instruction2.png");
    win = g.loadImage("win2.png");
  }

  Key key = new Key(utils.Const.WIDTH / 2, utils.Const.HEIGHT / 2);
  Player player = new Player();
  private PImage instruction;
  private PImage win;
  private boolean gameBegun = false;
}
