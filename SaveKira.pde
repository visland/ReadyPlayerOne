class SaveKira extends GameSystem {  
  @Override
  public void setup() {
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
    bar.display();
    dancer.display(bar.getIndex());
  }
  
  @Override
  protected void update() {
    bar.update();
  }

  public void initBackground() {
    instruction = loadImage("img/instruction2.png");
    win = loadImage("img/win2.png");
    lose = loadImage("img/lose.png");
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
   * 0 - up, 1 - down, 2 - left, 3 - right
   */
  private boolean inputValidation() {
    int currDirection = blockDirections[getIndex()];
    if (keyInput.isUpPressed) {
      hitKey = true;
      return currDirection == 0;
    } else if (keyInput.isDownPressed) {
      hitKey = true;
      return currDirection == 1;
    } else if (keyInput.isLeftPressed) {
      hitKey = true;
      return currDirection == 2;
    } else if (keyInput.isRightPressed) {
      hitKey = true;
      return currDirection == 3;
    } else {
      return true;
    }
  }
  
  public int getIndex() {
    return min((stickX - START_X + Const.BLOCK_LENGTH / 2) / Const.BLOCK_LENGTH,
               Const.NUM_BLOCK - 1);
  }
  
  public void update() {
    stickX += velocity;
    if (stickX > START_X + (Const.NUM_BLOCK - .5 ) * Const.BLOCK_LENGTH ) {
      renewBar();
    }
  }
  
  public void display() {
    for (int i = 0; i < Const.NUM_BLOCK; i++) {
      image(blockImgs[i], START_X + i * Const.BLOCK_LENGTH, START_Y,
            Const.BLOCK_LENGTH, Const.BLOCK_LENGTH);
    } 
    fill(0);
    rect(stickX, START_Y, Const.STICK_WIDTH, Const.BLOCK_LENGTH);
  }
  
  public boolean fail() {
    if (blockChanged()) {
      if (!hitKey) {
        turnPrevBlkRed();
        return true;
      }
      hitKey = false;
    }
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
    for (int i = 0; i < Const.NUM_BLOCK; i++) {
      blockDirections[i] = (int) random(NORMAL_IMGS.length);
      blockImgs[i] = NORMAL_IMGS[blockDirections[i]];
    }
  }
  
  public boolean blockChanged() {
    if (getIndex() != prevBlockIdx) {
      prevBlockIdx++;
      return true;
    } else {
      return false;
    }
  }
  
  public void turnGreen() {
    int idx = getIndex();
    blockImgs[idx] = SUCCESS[blockDirections[idx]];
  }
  
  public void turnRed() {
    int idx = getIndex();
    blockImgs[idx] = FAIL[blockDirections[idx]];
  }
  
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
  
    private boolean hitKey = false;
  private int barNum;
  private int prevBlockIdx = 0;
  private float velocity = (float)2.5;
  private int START_X = 200;
  private int START_Y = 700;
  private int stickX = START_X - Const.BLOCK_LENGTH / 2 + Const.STICK_WIDTH / 2 ;
  private PImage[] NORMAL_IMGS = new PImage[4];
  private PImage[] FAIL = new PImage[4];
  private PImage[] SUCCESS = new PImage[4];
  private int[] blockDirections = new int[Const.NUM_BLOCK];
  private PImage[] blockImgs = new PImage[Const.NUM_BLOCK];
}

public class Dancer {
  public void setup() {
    imgs[0] = loadImage("img/left.png");
    imgs[1] = loadImage("img/right.png");
  }
  
  public void display(int idx) {
    image(imgs[idx % imgs.length], width / 2, height / 2);
  }
   
  private PImage[] imgs = new PImage[2];
}