package game1;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import main.ReadyPlayerOne;
import utils.Const;
import utils.GameSystem;

public class CarRacing extends GameSystem {
  public CarRacing(ReadyPlayerOne g) {
    super(g);
  }

  @Override
  public void run() {
    g.background(Const.WHITE);
    player.update();
    player.display(g);
    updateCars();
    for (Car car : cars) {
      car.display(g);
      if (car.isCollision(player)) {
        refreshGame();
      }
    }
  }

  private void updateCars() {
    if (tick++ % TICKS_PER_CAR == 0) {
      cars.add(new Car(0, rand.nextInt(Const.HEIGHT)));
    }
    for (Car car : cars) {
      car.update();
    }
    if (!cars.isEmpty() && cars.get(0).x > Const.WIDTH) {
      cars.remove(0);
    }
  }

  private void refreshGame() {
    cars.clear();
    player.reset();
  }

  private int tick = 0;
  private static final int TICKS_PER_CAR = 40;
  private CarPlayer player = new CarPlayer(Const.WIDTH / 2, Const.HEIGHT / 2);
  private List<Car> cars = new LinkedList<Car>();
  private Random rand = new Random();
}
