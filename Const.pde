/**
 * Manages some constances here to avoid hard coding.
 */
class Const {
  /**
   * Number of screens
   */
  public static final int HALL = 0;
  public static final int CAR_RACING = 1;
  public static final int SAVE_KIRA = 2;
  public static final int MEANING_OF_GAME = 3;

  /**
   * Game 1
   */
  public static final float CAR_WIDTH = 80;
  public static final float CAR_LENGTH = 100;
  public static final float CAR_COLLISION_RADIUS = CAR_LENGTH / 2;
  public static final float PLAYER_WIDTH = 70;
  public static final float PLAYER_LENGTH = 86;
  public static final float PLAYER_COLLISION_RADIUS = CAR_WIDTH / 2;

  /**
   * Game 2
   */
  public static final int NUM_BLOCK = 9;
  public static final int BLOCK_LENGTH = 70;
  public static final int STICK_WIDTH = 4;
  public static final int SUCCEED_BAR_NUM = 1;

  /**
   * Game 3
   */
  public static final float KEY_INNER_RADIUS = 50;
  public static final float KEY_OUTER_RADIUS = 280;
  public static final float KEY_COLLISION_RADIUS = KEY_INNER_RADIUS;
  public static final float GAME3_PLAYER_COLLISION_RADIUS = 20;
  public static final float SNACK_COLLISION_RADIUS = 40;
}