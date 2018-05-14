abstract class GameSystem {
  public void run() {
    background(Const.WHITE);
    display();
    if (showBeginPrompt()) return;
    if (showFailPrompt()) return;
    if (showSucceedPrompt()) return;
    update();
    updateFailStatus();
    updateSucceedStatus();
  }
  
  abstract public void setup();
  abstract protected void refreshGame();
  
  /**
   * Returns true if the player fails.
   */
  abstract protected boolean fail();

  /**
   * Returns true if the player succeed.
   */
  abstract protected boolean succeed();

  /**
   * Displays moving objects within the game.
   */
  abstract protected void display();

  /**
   * Updates moving objects within the game.
   */
  abstract protected void update();

  /**
   * Shows begin prompt if the game hasn't begun yet.
   *
   * Returns {@result true} if the game hasn't begun yet.
   */
  protected final boolean showBeginPrompt() {
    boolean result = !begin;
    if (result) {
      image(instruction, width / 2, height / 2);
      if (keyInput.isSPressed) {
        begin = true;
      }
    }
    return result;
  }

  /**
   * Shows fail prompt if the player fails.
   *
   * Returns {@result true} if the player fails.
   */
  protected final boolean showFailPrompt() {
    boolean result = fail;
    if (result) {
      image(lose, width / 2, height / 2);
      if (keyInput.isRPressed) {
        fail = false;
        refreshGame();
      }
    }
    return result;
  }
  
  /**
   * Shows succed prompt if the player succeeds.
   *
   * Returns {@succeed true} if the player succeeds.
   */ 
  protected final boolean showSucceedPrompt() {
    if (succeed) {
      image(win, width / 2, height / 2);
      if (keyInput.isSpacePressed) {
        changePage(0);
        addPassedRoom();
      }
    }
    return succeed;
  }
  
  protected final void updateFailStatus() {
    fail = fail();
  }
  
  protected final void updateSucceedStatus() {
    succeed = succeed();
  }

  protected PImage instruction;
  protected PImage win;
  protected PImage lose;
  protected PImage background;
  private boolean begin = false;
  private boolean fail = false;
  private boolean succeed = false;
}