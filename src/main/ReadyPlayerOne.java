package main;

import hall.Hall;
import processing.core.PApplet;
import utils.Const;
import utils.GameSystem;

public class ReadyPlayerOne extends PApplet {
  public static void main(String[] args) {
    PApplet.main("main.ReadyPlayerOne");
  }

  @Override
  public void settings() {
    size(Const.WIDTH, Const.HEIGHT);
  }

  @Override
  public void setup() {
  }

  @Override
  public void draw() {
    gameSystems[currPage].run();
  }

  private int currPage = Const.HALL;
  private GameSystem[] gameSystems = new GameSystem[] { new Hall(this) };
}
