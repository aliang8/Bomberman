class Bomb {
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime;
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
    detonateTime = millis();
  }
  public boolean isOccupied() {
    return isOccupied;
  }
  void explosion() {
    //print(Sprites.size());
    curFrame = min((millis()-detonateTime-1000)/200+13, 19);
    wallFrame = min((millis()-detonateTime-1000)/200+7, 9);
    image(images.get(curFrame), x, y);
    //print(curFrame);
    if (curFrame < 13) {
      image(images.get(10), x, y);
    } else {
      if (grid[(y-per)/per][x/per] != 1) {
        image(images.get(curFrame + 31 - 13), x, y - per);
        if (Sprites.size() > 0 && Sprites.get(0).y + 45 + per > y && abs(Sprites.get(0).x - x) < 10) {
          // print("works");
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x, y-per);
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x, y-per);
          } else {
            grid[(y-per)/per][x/per] = 5;
          }
        }
      }
      if (grid[(y+per)/per][x/per] != 1) {
        image(images.get(curFrame + 39 - 13), x, y + per);
        if (Sprites.size() > 0 && Sprites.get(0).y - per < y && abs(Sprites.get(0).x - x) < 10) {
          // print("works");
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x, y+per);
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x, y+per);
          } else {
            grid[(y+per)/per][x/per] = 5;
          }
        }
      }
      if (grid[y/per][(x+per)/per] != 1) {
        image(images.get(curFrame + 47 - 13), x + per, y);
        if (Sprites.size() > 0 && Sprites.get(0).x - per < x && abs(Sprites.get(0).y - y) < 10) {
          //print("works");
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x+per, y);
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x+per, y);
          } else {
            grid[y/per][(x+per)/per] = 5;
          }
        }
      }
      if (grid[y/per][(x-per)/per] != 1) {
        image(images.get(curFrame + 55 - 13), x - per, y);
        if (Sprites.size() > 0 && Sprites.get(0).x + per > x && abs(Sprites.get(0).y - y) < 10) {
          //  print("works");
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x-per, y);
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x-per, y);
          } else {
            grid[y/per][(x-per)/per] = 5;
          }
        }
      }
    }
  }
}