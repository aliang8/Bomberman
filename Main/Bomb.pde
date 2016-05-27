import java.lang.Object;
import java.util.*;
class Bomb{
  //List of powerups
  int x, y;
  int lengthOfExplosion;
  int dropTime;
  int detonateTime = 3;
  String name;
  Boolean isOccupied = false;
  String state;
  int curFrame = 0;
  String curMove;
  
  //general bombs for all players w/o powerups
  Bomb(String bombType, Boolean filled, int x, int y){
    this.name = bombType;
    isOccupied = filled;
     this.x = x;
     this.y = y;
      curMove = "";
      curFrame = 0;
      state = "";      
  }
  Bomb(){
    lengthOfExplosion = 1;
  }
  int getLOE(){
    return lengthOfExplosion;
  }
  String toString(){
    return name;
  }
  public boolean isOccupied(){
    return isOccupied;
  }
  void bombExplode(int startFrame, int endFrame, String moveName) {
        state = "explode";
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
    void explosion(Bomb b){
      b.bombExplode(13, 23,"bombExplode");
    }
  
}