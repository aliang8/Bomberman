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
        for (int i = 1; i < 3; i++){
            String imageName = i + ".jpg";
            images.add(loadImage(imageName));
        }
  }
  
  public String getType(){
    return tileType;
  }
  
  public void showTile(String type, int x, int y){
    if(type.equals("bomb")){
      image(images.get(0),x,y);
    }else{
      image(images.get(1),x,y);
    }
  }
      
  public void setType(String name){
    tileType = name;
  }
  
  public String toString(){
    return tileType;
  }
}