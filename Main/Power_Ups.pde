class PowerUp{
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime = 3;
  String name;
  Boolean isOccupied;
  String state;
  
  //general bombs for all players w/o powerups
  PowerUp(String powerUpType, Boolean filled, int x, int y){
    this.name = powerUpType;
    isOccupied = filled;
     this.x = x;
     this.y = y;
      state = "";      
  }
  String toString(){
    return name;
  }
  public boolean isOccupied(){
    return isOccupied;
  }
}