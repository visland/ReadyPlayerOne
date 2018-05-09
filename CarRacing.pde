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
  public void run() {
    background(Const.WHITE);
    if (showBeginPrompt()) return;
    player.display();
    for (Car car : cars) {
      car.display();
    }
    if (showFailPrompt()) return;
    player.update();
    updateCars();
    for (Car car : cars) {
      if (car.isCollision(player)) {
        fail = true;
      }
    }
    if (carNum >= CAR_NUM) {
      finishingLine();
    }
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

  private void finishingLine() {
    rect(0, 0, 100, height * 2);
    if (player.x < 100) {
      image(win, width / 2, height / 2);
      if (keyInput.isSpacePressed) {
        changePage(0);
        addPassedRoom();
      }
    }
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
