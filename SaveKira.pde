/**
 * The second game : dancing game.
 */
class SaveKira extends GameSystem {  
  @Override
  public void setup() {
    initSound();
    initBackground();
    dancer.setup();
    bar.setup();
  }
  
  @Override
  protected void refreshGame() {
    bar.refresh();
  }
  
  @Override
  protected boolean fail() {
    return bar.fail();
  }
  
  @Override
  protected boolean succeed() { 
    return bar.getBarNum() == Const.SUCCEED_BAR_NUM;
  }
  
  @Override
  protected void display() {
    image(background, width / 2, height / 2);
    bar.display();
    dancer.display(bar.getKey());
  }
  
  @Override
  protected void update() {
    bar.update();
  }

  public void initBackground() {
    instruction = loadImage("img/instruction2.png");
    win = loadImage("img/win2.png");
    lose = loadImage("img/lose.png");
    background = loadImage("img/game2/bg.png");
  }
  
  public void initSound() {
    bgMusic = minim.loadFile("sound/dance.mp3");
  }
  
  private Dancer dancer = new Dancer();
  private Bar bar = new Bar();
}

public class Bar {  
  public void setup() {
    for (int i = 0; i < NORMAL_IMGS.length; i++) {
      NORMAL_IMGS[i] = loadImage("img/game2/" + i + "_normal.png");
      FAIL[i] = loadImage("img/game2/" + i + "_fail.png");
      SUCCESS[i] = loadImage("img/game2/" + i + "_success.png");
    }
    refresh();
  }
  
  /**
   * Determines whether user's input validates the arrow shown in the game.
   * '0' represents UP, '1' represents DOWN, '2' represents LEFT,and '3' represents RIGHT.
   *
   * Returns {true} if the input validates the arrow shown.
   */
  private boolean inputValidation() {
    int currDirection = blockDirections[getIndex()];
    if (keyInput.isUpPressed) {
      hitKey = true;
      keyNum = 0;
      return currDirection == 0;
    } else if (keyInput.isDownPressed) {
      hitKey = true;
      keyNum = 1;
      return currDirection == 1;
    } else if (keyInput.isLeftPressed) {
      hitKey = true;
      keyNum = 2;
      return currDirection == 2;
    } else if (keyInput.isRightPressed) {
      hitKey = true;
      keyNum = 3;
      return currDirection == 3;
    } else {
      return true;
    }
  }
  
  /**
   * Returns the index of block that the stick is currently on.
   */
  public int getIndex() {
    return min((stickX - START_X + Const.BLOCK_LENGTH / 2) / Const.BLOCK_LENGTH,
               Const.NUM_BLOCK - 1);
  }
  
  public void update() {
    stickX += velocity;
    // Renew all the blocks(bar) if all blocks have been passed by the stick.
    if (stickX > START_X + (Const.NUM_BLOCK - .5 ) * Const.BLOCK_LENGTH ) {
      renewBar();
    }
  }
  
  public void display() {
    // Shows all the blocks with arrows.
    for (int i = 0; i < Const.NUM_BLOCK; i++) {
      image(blockImgs[i], START_X + i * Const.BLOCK_LENGTH, START_Y,
            Const.BLOCK_LENGTH, Const.BLOCK_LENGTH);
    } 
    fill(0);
    rect(stickX, START_Y, Const.STICK_WIDTH, Const.BLOCK_LENGTH);
  }
  
  public boolean fail() {
    if (blockChanged()) {
      // Fails if user has no input in a whole block.
      if (!hitKey) {
        turnPrevBlkRed();
        return true;
      }
      // Resets hitkey to false for future use.
      hitKey = false;
    }
    // Fails if user has wrong input.
    if (!inputValidation()) {
      turnRed();
      hitKey = false;
      return true;
    } else if (hitKey) {
      turnGreen();
    }
    return false;
  }
  
  private void renewBar() {
    ++barNum;
    prevBlockIdx = 0;
    hitKey = false;
    stickX = START_X - Const.BLOCK_LENGTH / 2 + Const.STICK_WIDTH / 2 ;
    // Initializes all the arrows (randomly) on the blocks.
    for (int i = 0; i < Const.NUM_BLOCK; i++) {
      blockDirections[i] = (int) random(NORMAL_IMGS.length);
      blockImgs[i] = NORMAL_IMGS[blockDirections[i]];
    }
  }
  
 /**
   * Returns {true} if the stick has moved to a new block.
   */
  public boolean blockChanged() {
    if (getIndex() != prevBlockIdx) {
      prevBlockIdx++;
      return true;
    } else {
      return false;
    }
  }
  
 /**
   * Turns the block arrow green.
   */
  public void turnGreen() {
    int idx = getIndex();
    blockImgs[idx] = SUCCESS[blockDirections[idx]];
  }
  
 /**
   * Turns the block arrow red.
   */
  public void turnRed() {
    int idx = getIndex();
    blockImgs[idx] = FAIL[blockDirections[idx]];
  }
  
 /**
   * Turns the previous block arrow red if the user did not press any key
   * when the stick moves to a new block.
   */
  public void turnPrevBlkRed() {
    int idx = getIndex() - 1;
    blockImgs[idx] = FAIL[blockDirections[idx]];
  }
  
  public int getBarNum() {
    return barNum;
  }
  
  public void refresh() {
    barNum = -1;
    renewBar();
  }
  
  public int getKey() {
    return keyNum;
  }
  
  // The number that represents an arrow. (0 for UP, 1 for DOWN, 2 for LEFT, 3 for RIGHT).
  private int keyNum;
  // Equals true if the user has hit a key.
  private boolean hitKey = false;
  // The number of bars(9 blocks) the user is currently in.
  private int barNum;
  // Previous block index.
  private int prevBlockIdx = 0;
  private float velocity = (float)2.5;
  private int START_X = 200;
  private int START_Y = 700;
  // The X position of the stick.
  private int stickX = START_X - Const.BLOCK_LENGTH / 2 + Const.STICK_WIDTH / 2 ;
  // Images of arrows in normal status.
  private PImage[] NORMAL_IMGS = new PImage[4];
  // Images of arrows in fail status.
  private PImage[] FAIL = new PImage[4];
  // Images of arrows in succeed status.
  private PImage[] SUCCESS = new PImage[4];
  private int[] blockDirections = new int[Const.NUM_BLOCK];
  private PImage[] blockImgs = new PImage[Const.NUM_BLOCK];
}

public class Dancer {
  public void setup() {
    imgs[0] = loadImage("img/game2/up.png");
    imgs[1] = loadImage("img/game2/down.png");
    imgs[2] = loadImage("img/game2/left.png");
    imgs[3] = loadImage("img/game2/right.png");
  }
  
  /**
   * Displays corresponding dancer.
   *
   * @para idx
   *       The number which represents four directions.
   */
  public void display(int idx) {
    image(imgs[idx], width / 2, height / 2);
  }
   
  private PImage[] imgs = new PImage[4];
}