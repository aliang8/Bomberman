import java.lang.Object;
import java.util.*;
public class Tile{
  ArrayList<PImage> images;
  String tileType;
  Boolean Destroyable;
  Boolean Alive = true;

  public Tile(String name, Boolean destroy, Boolean deader){
    tileType = name;
    Destroyable = destroy;
    Alive = deader;
     images = new ArrayList <PImage>();
        for (int i = 1; i < 10; i++){
            String imageName = i + ".jpg";
            images.add(loadImage(imageName));
            images.get(i-1).resize(50,50);
        }
  }
  
  public String getType(){
    return tileType;
  }
  
  public void showTile(String type, int x, int y){
    if(type.equals("steel")){
      image(images.get(1),x,y);
    }else if(type.equals("metal")){
      image(images.get(4),x,y);
    }else if(type.equals("wood")){
      image(images.get(6),x,y);
    }else if(type.equals("floor")){
      image(images.get(8),x,y);
    }
  }
      
  public void setType(String name){
    tileType = name;
  }
  public String getTileType(){
    return tileType;
  }
  public String toString(){
    return tileType;
  }
}