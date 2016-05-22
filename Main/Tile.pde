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
        }
  }
  
  public String getType(){
    return tileType;
  }
  
  public void showTile(String type, int x, int y){
    if(type.equals("steel")){
      images.get(1).resize(50,50);
      image(images.get(1),x,y);
    }else if(type.equals("metal")){
      images.get(4).resize(50,50);
      image(images.get(4),x,y);
    }else if(type.equals("wood")){
      images.get(6).resize(50,50);
      image(images.get(6),x,y);
    }else if(type.equals("floor")){
      images.get(8).resize(50,50);
      image(images.get(8),x,y);
    }
  }
      
  public void setType(String name){
    tileType = name;
  }
  
  public String toString(){
    return tileType;
  }
}