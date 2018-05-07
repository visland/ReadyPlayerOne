package main;

import game1.CarRacing;
import game2.SaveKira;
import game3.MeaningOfGame;
import hall.Hall;
import processing.core.PApplet;
import processing.core.PImage;
import utils.Const;
import utils.GameSystem;
import utils.KeyInput;

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
    rectMode(CENTER);
    imageMode(CENTER);
    start = loadImage("start.jpg");
    ((Hall) gameSystems[0]).initBackground();
  }

  @Override
  public void draw() {
    if (!hasStart) {
      image(start, Const.WIDTH / 2, Const.HEIGHT / 2);
      if (KeyInput.isSPressed) {
        hasStart = true;
      }
    } else {
      gameSystems[currPage].run();
    }
  }

  @Override
  public void keyPressed() {
    KeyInput.update(key, keyCode, true);
  }

  @Override
  public void keyReleased() {
    KeyInput.update(key, keyCode, false);
  }

  /**
   * 
   * @param page
   *        The page(screen) that will change to.
   */
  public void changePage(int page) {
    currPage = page;
  }

  private int currPage = Const.HALL;
  private PImage start;
  private boolean hasStart = false;
  public boolean isFirstPassed = false;
  public boolean isSecondPassed = false;
  private GameSystem[] gameSystems = new GameSystem[] { new Hall(this), new CarRacing(this),
      new SaveKira(this), new MeaningOfGame(this) };
}
