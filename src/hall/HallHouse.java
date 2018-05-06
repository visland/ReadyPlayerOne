package hall;

import main.ReadyPlayerOne;
import utils.KeyInput;
import utils.MovingObject;

public class HallHouse {
  public HallHouse(float _x, float _y) {
    x = _x;
    y = _y;
  }

  public void drawHouse(ReadyPlayerOne g) {
    // Draws the house of a game and its door
    // TODO: change them to pictures of house.
    g.rect(x, y, HOUSE_WIDTH, HOUSE_LENGTH);
    g.rect(x + HOUSE_WIDTH / 3, y + HOUSE_LENGTH - DOOR_LENGTH, DOOR_WIDTH, DOOR_LENGTH);
  }

  /**
   * 
   * @param g
   * @return Returns true if the character is in the house.
   */
  public boolean inHouse(ReadyPlayerOne g) {
    if (KeyInput.isUpPressed && MovingObject.x > x + HOUSE_WIDTH / 3
        && MovingObject.x < x + HOUSE_WIDTH / 3 + DOOR_WIDTH) {
      return true;
    }
    return false;
  }

  private float x;
  private float y;
  private float DOOR_WIDTH = 40;
  private float DOOR_LENGTH = 100;
  private float HOUSE_WIDTH = 150;
  private float HOUSE_LENGTH = 440;
}
