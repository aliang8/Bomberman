public class Tile{
  String name;
  Boolean Destroyable;
  Boolean Alive = true;
  Boolean isOccupied = false;
  int x, y;
  String state;
  int curFrame;
  String curMove;
   
  public Tile(String tileType, Boolean filled, int x, int y){
    name = tileType;
    this.x = x;
    this.y = y;
    isOccupied = filled;
    state = "";
    curMove = "";
    curFrame = 0;
    state = "";      
  }
  public String getType(){
    return name;
  }
  public void setType(String tileType){
    name = tileType;
  }
  public String toString(){
    return name;
  }
  public String getTileType(){
    return name;
  }
  public boolean isOccupied(){
    return isOccupied;
  }
  void breakWall(int startFrame, int endFrame, String moveName) {
        state = "breaking";
        if (!curMove.equals(moveName)) {
            curMove = moveName;
            curFrame = startFrame;
        }
        pushMatrix();
        image(images.get(curFrame), x, y);
        popMatrix();
        curFrame++;
        if (curFrame > endFrame) {
            curMove = "";
            curFrame = 0;
            state = "";
        }
    }
}