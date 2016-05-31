class Bomb {
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime = millis();
  String name;
  int curFrame;
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
    curFrame = min((millis()-detonateTime - 200)/200+13, 19);
    image(images.get(curFrame), x, y);
    if (grid[(y-per)/per][x/per] != 1) {
      image(images.get(curFrame + 31 - 13), x, y - per);
    }
    if (grid[(y+per)/per][x/per] != 1) {
      image(images.get(curFrame + 39 - 13), x, y + per);
    }
    if (grid[y/per][(x+per)/per] != 1) {
      image(images.get(curFrame + 47 - 13), x + per, y);
    }
    if (grid[y/per][(x-per)/per] != 1) {
      image(images.get(curFrame + 55 - 13), x - per, y);
    }
  }
}