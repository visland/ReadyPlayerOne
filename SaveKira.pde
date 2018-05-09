class SaveKira extends GameSystem {
  @Override
  public void setup() {
    initBackground();
  }
  
  @Override
  public void run() {
    background(Const.WHITE);
    if (showBeginPrompt()) return;
  }
  
  @Override
  protected void refreshGame() {}

  public void initBackground() {
    instruction = loadImage("img/instruction3.png");
    win = loadImage("img/win3.png");
  }
}