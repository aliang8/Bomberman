public class Tile{
  ArrayList<PImage> images;
  String tileType;
  Boolean Destroyable;
  Boolean Alive = true;
  Boolean isOccupied = false;
   
  public Tile(String name, Boolean destroy, Boolean deader, Boolean filled){
    tileType = name;
    Destroyable = destroy;
    isOccupied = filled;
    Alive = deader;
  }
  
  public String getType(){
    return tileType;
  }
      
  public void setType(String name){
    tileType = name;
  }
  
  public String toString(){
    return tileType;
  }
  public String getTileType(){
    return tileType;
  }
  public boolean isOccupied(){
    return isOccupied;
  }
}