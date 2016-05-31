import java.lang.Object;
import java.util.*;
class Bomb{
  //List of powerups
  ArrayList<PImage> images;
  int lengthOfExplosion;
  String name;
  String bombType;
  String specialEffects;
  Boolean isOccupied = false;
  
  //general bombs for all players w/o powerups
  Bomb(String name, Boolean filled){
    this.name = name;
    isOccupied = filled;
  }
  Bomb(){
    lengthOfExplosion = 1;
  }
  int getLOE(){
    return lengthOfExplosion;
  }
  String toString(){
    return bombType;
  }
  public boolean isOccupied(){
    return isOccupied;
  }
  
}