import java.lang.Object;
import java.util.*;
class Bomb{
  //List of powerups
  ArrayList<PImage> images;
  int lengthOfExplosion;
  String name;
  String bombType;
  String specialEffects;
  
  //general bombs for all players w/o powerups
  Bomb(String name){
    this.name = name;
    images = new ArrayList <PImage>();
    for (int i = 1; i < 3; i++){
      String imageName = "Bomb" + i + ".gif";
      images.add(loadImage(imageName));
      images.get(i-1).resize(50,50);
    }
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
  
}