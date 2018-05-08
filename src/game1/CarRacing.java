package game1;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import main.ReadyPlayerOne;
import processing.core.PImage;
import utils.Const;
import utils.GameSystem;
import utils.KeyInput;

public class CarRacing extends GameSystem {
  public CarRacing(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
    if (!gameBegan) {
      g.image(instruction, Const.WIDTH / 2, Const.HEIGHT / 2);
      if (KeyInput.isSPressed) {
        gameBegan = true;
      }
    } else {
      player.display(g);
      if (!isFailed) {
        player.update();
        updateCars();
      }
      for (Car car : cars) {
        car.display(g);
        if (car.isCollision(player)) {
          isFailed = true;
          fail(g);
          if (KeyInput.isRPressed) {
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
      cars.add(new Car(0, rand.nextInt(Const.HEIGHT)));
      carNum++;
    }
    for (Car car : cars) {
      car.update();
    }
    // Removes the car if it is out of the screen.
    if (!cars.isEmpty() && cars.get(0).x > Const.WIDTH) {
      cars.remove(0);
    }
  }

  private void refreshGame() {
    cars.clear();
    player.reset();
    carNum = 0;
  }

  private void fail(ReadyPlayerOne g) {
    g.text("You lose!", 200, 300);
    g.text("Press R to restart", 300, 300);
  }

  private void finishingLine() {
    g.rect(0, 0, 100, Const.HEIGHT * 2);
    if (player.x < 100) {
      g.image(win, Const.WIDTH / 2, Const.HEIGHT / 2);
      if (KeyInput.isSpacePressed) {
        g.changePage(0);
        g.addPassedRoom();
      }
    }
  }

  public void initBackground() {
    instruction = g.loadImage("instruction1.png");
    win = g.loadImage("win1.png");
  }

  private PImage instruction;
  private PImage win;
  private boolean gameBegan = false;
  private int tick = 0;
  private int carNum = 0;
  private final int CAR_NUM = 10;
  private boolean isFailed = false;
  private static final int TICKS_PER_CAR = 40;
  private CarPlayer player = new CarPlayer(Const.WIDTH / 2, Const.HEIGHT / 2);
  private List<Car> cars = new LinkedList<Car>();
  private Random rand = new Random();
}
