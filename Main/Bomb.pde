class Bomb {
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime;
  String name;
  int curFrame;
  int wallFrame;
  Boolean isOccupied;


  //BOMB CONSTRUCTOR
  Bomb(String bombType, Boolean filled, int x, int y) {
    this.name = bombType;
    isOccupied = filled;
    this.x = x;
    this.y = y;
    detonateTime = millis();
  }

  //EXPLOSION 
  void explosion() {
    //ITERATES THROUGH FRAMES
    curFrame = min((millis()-detonateTime-1000)/200+13, 19);
    wallFrame = min((millis()-detonateTime-1000)/200+7, 9);
    //STARTS WITH BOMB
    if (curFrame < 13) {
      image(images.get(10), x, y);
    } else {
      //CENTER OF EXPLOSION
      image(images.get(curFrame), x, y);
      //DISPLAY ARMS OF EXPLOSION IF IT IS NOT NEXT TO A WALL
      if (grid[(y - s.range * per)/per][x/per] == 1) {
        //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
        for (int i = 1; i < s.range; i++) {
          if (grid[(y - s.range * per)/per][x/per] != 1) {
            if (s.range > 1) {
              image(images.get(curFrame + 71 - 13), x, y - (s.range - 1) * per);
            }
          }
        }
        //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
        if (Sprites.size() > 0 && Sprites.get(0).y + 45 + per > y && abs(Sprites.get(0).x - x) < 10) {
          if (Sprites.get(0).t == 0) {
            Sprites.get(0).t = millis();
          }
          //REMOVE SPRITE AFTER DIE ANIMATION
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
        //DISPLAY WALL CRACKING ANIMATION 
        image(images.get(wallFrame), x, y - s.range * per);
        //AFTER WALL DISAPPEARS, HAS 1/3 CHANCE OF DROPPING A POWERUP
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x, y - s.range * per);
          } else {
            grid[(y - s.range * per)/per][x/per] = 5;
          }
        }
      } else {
        image(images.get(curFrame + 31 - 13), x, y - s.range * per);
        for (int i = 1; i < s.range; i++) {
          if (grid[(y - s.range * per)/per][x/per] != 1) {
            if (s.range > 1) {
              image(images.get(curFrame + 71 - 13), x, y - (s.range - 1) * per);
            }
          }
        }
        //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
        if (Sprites.size() > 0 && Sprites.get(0).y + 45 + per > y && abs(Sprites.get(0).x - x) < 10) {
          if (Sprites.get(0).t == 0) {
            Sprites.get(0).t = millis();
          }
          //REMOVE SPRITE AFTER DIE ANIMATION
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      }
      if (grid[(y+per)/per][x/per] != 1) {
        image(images.get(curFrame + 39 - 13), x, y + s.range * per);
        if (s.range > 1) {
          for (int i = s.range; i > 1; i--) {
            image(images.get(curFrame + 71 - 13), x, y + (s.range - 1) * per);
          }
        }
        if (Sprites.size() > 0 && Sprites.get(0).y - per < y && abs(Sprites.get(0).x - x) < 10) {
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x, y + s.range *per);
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x, y+per);
          } else {
            grid[(y+per)/per][x/per] = 5;
          }
        }
      }
      if (grid[y/per][(x+per)/per] != 1) {
        image(images.get(curFrame + 47 - 13), x + s.range * per, y);
        if (s.range > 1) {
          for (int i = s.range; i > 1; i--) {
            image(images.get(curFrame + 63 - 13), x + (s.range - 1) * per, y);
          }
        }
        if (Sprites.size() > 0 && Sprites.get(0).x - per < x && abs(Sprites.get(0).y - y) < 10) {
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x + s.range * per, y);
        if (wallFrame == 9) {
          if (Math.random() < .33) {
            dropPowerUp(x+per, y);
          } else {
            grid[y/per][(x+per)/per] = 5;
          }
        }
      }
      if (grid[y/per][(x-per)/per] != 1) {
        image(images.get(curFrame + 55 - 13), x - s.range * per, y);
        if (s.range > 1) {
          for (int i = s.range; i > 1; i--) {
            image(images.get(curFrame + 63 - 13), x - (s.range - 1) * per, y);
          }
        }
        if (Sprites.size() > 0 && Sprites.get(0).x + per > x && abs(Sprites.get(0).y - y) < 10) {
          //  print("works");
          Sprites.get(0).t = millis();
          Sprites.get(0).die();
          if (Sprites.get(0).curFrame == 24) {
            Sprites.remove(0);
          }
        }
      } else {
        image(images.get(wallFrame), x - s.range * per, y);
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