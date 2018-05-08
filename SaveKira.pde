class SaveKira extends GameSystem {
  @Override
  public void setup() {}
  
  @Override
  public void run() {
    background(Const.WHITE);
    if (!gameBegan) {
      image(instruction, width / 2, height / 2);
      if (keyInput.isSPressed) {
        gameBegan = true;
      }
    } else {

    }
  }

  public void initBackground() {
    instruction = loadImage("instruction3.png");
    win = loadImage("win3.png");
  }

  private PImage instruction;
  private PImage win;
  private boolean gameBegan = false;
}