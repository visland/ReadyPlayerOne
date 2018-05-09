abstract class GameSystem {
  abstract public void setup();
  abstract public void run();
  abstract protected void refreshGame();

  protected boolean showBeginPrompt() {
    if (!begin) {
      image(instruction, width / 2, height / 2);
      if (keyInput.isSPressed) {
        begin = true;
      }
    }
    return !begin;
  }
  
  protected boolean showFailPrompt() {
    if (fail) {
      text("You lose!", 200, 300);
      text("Press R to restart", 300, 300);
      if (keyInput.isRPressed) {
        fail = false;
        refreshGame();
      }
    }
    return fail;
  }

  protected PImage instruction;
  protected PImage win;
  private boolean begin = false;
  protected boolean fail = false;
}