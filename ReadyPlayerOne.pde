import ddf.minim.*;

public void setup() {
  size(1024, 768);
  rectMode(CENTER);
  imageMode(CENTER);
  colorMode(RGB, 255);
  minim = new Minim(this);
  startPage = minim.loadFile("sound/hall.mp3");
  failMusic = minim.loadFile("sound/fail.wav");
  victoryMusic = minim.loadFile("sound/victory.wav");
  winMusic = minim.loadFile("sound/win.wav");
  start = loadImage("img/start.jpg");
  finish = loadImage("img/finish.png");
  // Sets up all the games.
  for (GameSystem gameSystem: gameSystems) {
    gameSystem.setup();
  }
}

/**
 * The game starts with a start prompt. User presses 's' to start the game and 
 * go to the game hall. After the player passed all three games, the victory
 * prompt will be shown.
 */
public void draw() {
  if (!hasStart) {
    startPage.play();
    image(start, width / 2, height / 2);
    if (keyInput.isSPressed) {
      hasStart = true;
      startPage.pause();
    }
  } else {
    gameSystems[currPage].run();
  }
  if (numPassedRoom == 3) {
    victoryMusic.play();
    image(finish, width / 2, height / 2);
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

protected Minim minim;
protected AudioPlayer failMusic;
protected AudioPlayer winMusic;
protected AudioPlayer victoryMusic;
private AudioPlayer startPage;
private int currPage = Const.HALL;
private PImage start;
private PImage finish;
private boolean hasStart = false;
private int numPassedRoom = 0;
// Array that contains four main windows the game has.
private GameSystem[] gameSystems = new GameSystem[] { new Hall(), new CarRacing(), 
  new SaveKira(), new MeaningOfGame() };
private KeyInput keyInput = new KeyInput();