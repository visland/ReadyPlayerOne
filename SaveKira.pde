class SaveKira extends GameSystem {
  @Override
  public void setup() {
    initBackground();
  }
  
  @Override
  protected void refreshGame() {}
  @Override
  protected boolean fail() { return false; }
  @Override
  protected boolean succeed() { return false; }
  @Override
  protected void display() {}
  @Override
  protected void update() {}

  public void initBackground() {
    instruction = loadImage("img/instruction3.png");
    win = loadImage("img/win3.png");
  }
}
