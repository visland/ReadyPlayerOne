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
    ((Hall) gameSystems[0]).initBackground();
  }

  @Override
  public void draw() {
    gameSystems[currPage].run();
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
    if (page == 0) {
      currPage = Const.HALL;
    } else if (page == 1) {
      currPage = Const.CAR_RACING;
    } else if (page == 2) {
      currPage = Const.SAVE_KIRA;
    } else if (page == 3) {
      currPage = Const.MEANING_OF_GAME;
    }
  }

  private int currPage = Const.HALL;
  private GameSystem[] gameSystems = new GameSystem[] { new Hall(this), new CarRacing(this),
      new SaveKira(this), new MeaningOfGame(this) };
}
