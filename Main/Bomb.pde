class Bomb {
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime = millis();
  String name;
  int curFrame;
  int wallFrame;
  Boolean isOccupied;


  //general bombs for all players w/o powerups
  Bomb(String bombType, Boolean filled, int x, int y) {
    this.name = bombType;
    isOccupied = filled;
    this.x = x;
    this.y = y;
  }
  String toString() {
    return name;
  }
  public boolean isOccupied() {
    return isOccupied;
  }
  void explosion() {
    curFrame = min((millis()-detonateTime-200)/200+13, 19);
    wallFrame = min((millis()-detonateTime-200)/200+7, 9);
    image(images.get(curFrame), x, y);
    if (grid[(y-per)/per][x/per] != 1) {
      image(images.get(curFrame + 31 - 13), x, y - per);
      if(Sprites.get(0).y + 25 - (y - 25 - per) < 0){
        print("works");
        Sprites.get(0).die(20, 24, "dying");
      }
    } else {
      image(images.get(wallFrame), x, y-per);
    }
    //grid[(y-per)/per][x/per] = 5;
    if (grid[(y+per)/per][x/per] != 1) {
      image(images.get(curFrame + 39 - 13), x, y + per);
    } else {
      image(images.get(wallFrame), x, y+per);
    }
    //grid[(y+per)/per][x/per] = 5;
    if (grid[y/per][(x+per)/per] != 1) {
      image(images.get(curFrame + 47 - 13), x + per, y);
    } else {
      image(images.get(wallFrame), x+per, y);
    }
    //grid[(y+per)/per][x/per] = 5;
    if (grid[y/per][(x-per)/per] != 1) {
      image(images.get(curFrame + 55 - 13), x - per, y);
    } else {
      image(images.get(wallFrame), x-per, y);
    }
    //grid[y/per][(x-per)/per] = 5;
  }
}