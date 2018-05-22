/**
 * Four main windows in the game. (game hall and three games)
 */
abstract class GameSystem {
  /**
   * Displays all the elements at first.
   * Then shows begin prompt. After the user presses 's' to start, continue;
   * If the user fails/ succeeds, show fail/ succeed prompt and stop updating.
   */
  public void run() {
    bgMusic.play();
    display();
    if (showBeginPrompt()) return;
    if (showFailPrompt()) return;
    if (showSucceedPrompt()) return;
    update();
    updateFailStatus();
    updateSucceedStatus();
  }
  
  /**
   * Basic method that is ran in basic setup() method.
   * Initialized images and musics in sthis method.
   */
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
        bgMusic.pause();
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
  protected AudioPlayer bgMusic;
  protected PImage background;
  private boolean begin = false;
  private boolean fail = false;
  private boolean succeed = false;
}