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
    if (!gameBegan) {
      image(instruction, width / 2, height / 2);
      if (keyInput.isSPressed) {
        gameBegan = true;
      }
    } else {
      player.display();
      if (!isFailed) {
        player.update();
        updateCars();
      }
      for (Car car : cars) {
        car.display();
        if (car.isCollision(player)) {
          isFailed = true;
          fail();
          if (keyInput.isRPressed) {
            isFailed = false;
            refreshGame();
          }
        }
      }
      if (carNum >= CAR_NUM) {
        finishingLine();
      }
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

  private void refreshGame() {
    cars.clear();
    player.reset();
    carNum = 0;
  }

  private void fail() {
    text("You lose!", 200, 300);
    text("Press R to restart", 300, 300);
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

  private PImage instruction;
  private PImage win;
  private boolean gameBegan = false;
  private int tick = 0;
  private int carNum = 0;
  private final int CAR_NUM = 10;
  private boolean isFailed = false;
  private static final int TICKS_PER_CAR = 40;
  private CarPlayer player;
  private List<Car> cars = new LinkedList<Car>();
  private Random rand = new Random();
}