public void setup() {
  size(1024, 768);
  rectMode(CENTER);
  imageMode(CENTER);
  colorMode(RGB, 255);
  start = loadImage("img/start.jpg");
  for (GameSystem gameSystem: gameSystems) {
    gameSystem.setup();
  }
}

public void draw() {
  if (!hasStart) {
    image(start, width / 2, height / 2);
    if (keyInput.isSPressed) {
      hasStart = true;
    }
  } else {
    gameSystems[currPage].run();
  }
}

public void keyPressed() {
  keyInput.update(key, keyCode, true);
}

public void keyReleased() {
  keyInput.update(key, keyCode, false);
}

/**
 * @param page
 *        The page(screen) that will change to.
 */
public void changePage(int page) {
  currPage = page;
}

public int getPassedRoom() {
  return numPassedRoom;
}

public void addPassedRoom() {
  numPassedRoom++;
}

private int currPage = Const.HALL;
private PImage start;
private boolean hasStart = false;
private int numPassedRoom = 0;
private GameSystem[] gameSystems = new GameSystem[] { new Hall(), new CarRacing(), 
  new SaveKira(), new MeaningOfGame() };
private KeyInput keyInput = new KeyInput();