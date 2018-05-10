import java.util.LinkedList;
import java.util.List;
import java.util.Random;

class CarRacing extends GameSystem {  
  @Override
  public void setup() {
    initBackground();
    player = new CarPlayer(width / 2, height / 2);
  }
  
  @Override
  protected void display() {
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
      rect(0, 0, 100, height * 2);
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
    return carNum >= CAR_NUM && player.x < 100;
  }

  private void updateCars() {
    if (tick++ % TICKS_PER_CAR == 0 && carNum < CAR_NUM) {
      cars.add(new Car(0, rand.nextInt(height)));
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
  }

  private int tick = 0;
  private int carNum = 0;
  private final int CAR_NUM = 10;
  private static final int TICKS_PER_CAR = 40;
  private CarPlayer player;
  private List<Car> cars = new LinkedList<Car>();
  private Random rand = new Random();
}

/**
 * The cars in game 1.
 */
public class Car extends CollisionObject {
  public Car(float x, float y) {
    super(x, y, Const.CAR_COLLISION_RADIUS);
  }

  @Override
  public void update() {
    x += CAR_VELOCITY;
  }

  @Override
  public void display() {
    ellipse(x, y, Const.CAR_WIDTH, Const.CAR_WIDTH);
  }

  private float CAR_VELOCITY = (float) 2.5;
}

/**
 * The player in game 1.
 */
public class CarPlayer extends CollisionObject {
  public CarPlayer(float x, float y) {
    super(x, y, Const.PLAYER_COLLISION_RADIUS);
  }

  @Override
  public void update() {
    updateX();
    updateY();
  }

  @Override
  public void display() {
    g.rect(x, y, 30, 30);
  }

  public void reset() {
    x = width / 2;
    y = height / 2;
  }
}