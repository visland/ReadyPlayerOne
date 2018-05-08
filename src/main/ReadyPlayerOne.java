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
    getHall().initBackground();
    getCarRacing().initBackground();
    getSaveKira().initBackground();
    getMeaningOfGame().initBackground();
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

  public Hall getHall() {
    return (Hall) gameSystems[0];
  }

  public CarRacing getCarRacing() {
    return (CarRacing) gameSystems[1];
  }

  public SaveKira getSaveKira() {
    return (SaveKira) gameSystems[2];
  }

  public MeaningOfGame getMeaningOfGame() {
    return (MeaningOfGame) gameSystems[3];
  }

  public int getPassedRoom() {
    return numPassedRoom;
  }

  public void addPassedRoom() {
    numPassedRoom++;
  }

  private int currPage = Const.HALL;
  private PImage start;
  private boolean hasStart = false;
  private int numPassedRoom = 0;
  private GameSystem[] gameSystems = new GameSystem[] { new Hall(this), new CarRacing(this),
      new SaveKira(this), new MeaningOfGame(this) };
}
