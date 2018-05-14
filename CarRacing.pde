import java.util.LinkedList;
import java.util.List;
import java.util.Random;

class CarRacing extends GameSystem {  
  @Override
  public void setup() {
    initBackground();
    player = new CarPlayer(width / 2, height / 2);
    player.setup();
    for (int i = 0; i < CAR_IMGS.length; i++) {
      CAR_IMGS[i] = loadImage("img/game1/" + i + ".png");
    }
  }
  
  @Override
  protected void display() {
    image(background, width / 2, height /2 );
    player.display();
    for (Car car : cars) {
      car.display();
    }
  }
  
  @Override
  protected void update() {
    player.update();
    updateCars();
    if (carNum >= CAR_NUM) {
      image(finishingLine, width / 2, height /2 );
    }
  }
  
  @Override
  protected boolean fail() {
    for (Car car: cars) {
      if (car.isCollision(player)) {
        return true;
      }
    }
    return false;
  }
  
  @Override
  protected boolean succeed() {
    return carNum >= CAR_NUM && player.x < 180;
  }

  private void updateCars() {
    if (tick++ % TICKS_PER_CAR == 0 && carNum < CAR_NUM) {
      cars.add(new Car(0, random(height), CAR_IMGS[(int)random(0, CAR_IMGS.length)]));
      carNum++;
    }
    for (Car car : cars) {
      car.update();
    }
    // Removes the car if it is out of the screen.
    if (!cars.isEmpty() && cars.get(0).x > width) {
      cars.remove(0);
    }
  }

  @Override
  protected void refreshGame() {
    cars.clear();
    player.reset();
    carNum = 0;
  }

  public void initBackground() {
    instruction = loadImage("img/instruction1.png");
    win = loadImage("img/win1.png");
    lose = loadImage("img/lose.png");
    background = loadImage("img/game1/bg.png");
    finishingLine = loadImage("img/game1/line.png");
  }

  private int tick = 0;
  private int carNum = 0;
  private final int CAR_NUM = 10;
  private static final int TICKS_PER_CAR = 40;
  private CarPlayer player;
  private List<Car> cars = new LinkedList<Car>();
  private PImage[] CAR_IMGS = new PImage[5];
  private PImage finishingLine;
}

/**
 * The cars in game 1.
 */
public class Car extends CollisionObject {
  public Car(float x, float y, PImage img) {
    super(x, y, Const.CAR_COLLISION_RADIUS);
    carImg = img;
  }
  
  @Override
  public void update() {
    x += CAR_VELOCITY;
  }

  @Override
  public void display() {
    image(carImg, x, y, Const.CAR_LENGTH, Const.CAR_WIDTH);
  }

  private PImage carImg;
  private float CAR_VELOCITY = (float) 2.5;  
}

/**
 * The player in game 1.
 */
public class CarPlayer extends CollisionObject {
  public CarPlayer(float x, float y) {
    super(x, y, Const.PLAYER_COLLISION_RADIUS);
  }
  
  public void setup() {
    carPlayer = loadImage("img/game1/player.png");
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display() {
    image(carPlayer, x, y, Const.PLAYER_LENGTH, Const.PLAYER_WIDTH);
  }

  public void reset() {
    x = width / 2;
    y = height / 2;
  }
  
  PImage carPlayer = new PImage();
}