class SaveKira extends GameSystem {
  @Override
  public void setup() {
    initBackground();
    dancer.setup();
    bar.setup();
  }
  
  @Override
  protected void refreshGame() {
  
  }
  
  @Override
  protected boolean fail() { 
    return false; 
  }
  
  @Override
  protected boolean succeed() { 
    return false; 
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
    instruction = loadImage("img/instruction3.png");
    win = loadImage("img/win3.png");
  }
  
  private Dancer dancer = new Dancer();
  private Bar bar = new Bar();
}

public class Bar {  
  public void setup() {
    renewBar();
  }
  
  public int getIndex() {
    return (stickX - START_X + Const.BLOCK_LENGTH / 2) / Const.BLOCK_LENGTH;
  }
  
  public void update() {
    stickX += velocity;
    if (stickX > START_X + (Const.NUM_BLOCK - .5 ) * Const.BLOCK_LENGTH ) {
      renewBar();
    }
  }
  
  public void display() {
    for (int i = 0; i < Const.NUM_BLOCK; i++) {
      fill(barColor[i]);
      rect(START_X + i * Const.BLOCK_LENGTH, START_Y, Const.BLOCK_LENGTH, Const.BLOCK_LENGTH);
    } 
    fill(0);
    rect(stickX, START_Y, Const.STICK_WIDTH, Const.BLOCK_LENGTH);
  }
  
  private void renewBar() {
    stickX = START_X - Const.BLOCK_LENGTH / 2 + Const.STICK_WIDTH / 2 ;
    for (int i = 0; i < Const.NUM_BLOCK; i++) {
      barColor[i] = COLORS[(int) random(COLORS.length)];
    }
  }
  
  private float velocity = (float)2.5;
  private int START_X = 200;
  private int START_Y = 700;
  private int stickX = START_X - Const.BLOCK_LENGTH / 2 + Const.STICK_WIDTH / 2 ;
  private color[] COLORS = {#D34F4F, #385FA2, #38A24F, #E4EA42};
  private color[] barColor = new color[Const.NUM_BLOCK];
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