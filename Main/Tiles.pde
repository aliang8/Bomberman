import java.lang.Object;
import java.util.*;
public class Tiles{
  String tileType;
  Boolean Destroyable;
  Boolean Alive = true;
  ArrayList<PImage> images;

  public Tiles(String name, Boolean destroy, Boolean deader){
    tileType = name;
    Destroyable = destroy;
    Alive = deader;
    images = new ArrayList <PImage>();
    for (int i = 0; i < 3; i++){
        String imageName = "(" + (i+1) + ").gif";
        images.add(loadImage(imageName));
    }
  }
  
  public String getType(){
    return tileType;
  }
  
  public void setType(String name){
    tileType = name;
  }
}