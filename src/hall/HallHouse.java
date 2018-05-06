package hall;

import main.ReadyPlayerOne;
import processing.core.PApplet;
import utils.KeyInput;

public class HallHouse {
  public void drawHouse(PApplet g) {
    // Draws first game and its door
    // TODO: change them to pictures of house.
    g.rect(300, 200, 150, 440);
    g.rect(350, 540, 40, 100);
    // Draws second game and its door
    g.rect(550, 200, 150, 440);
    g.rect(600, 540, 40, 100);
    // Draws third game and its door
    g.rect(800, 200, 150, 440);
    g.rect(850, 540, 40, 100);
  }

  public void inHouse(float x, ReadyPlayerOne g) {
    if (KeyInput.isUpPressed) {
      if (x > 350 && x < 390) {
        g.changePage(1);
      } else if (x > 600 && x < 640) {
        g.changePage(2);
      } else if (x > 850 && x < 890) {
        g.changePage(3);
      }
    }
  }
}
