class Bomb {
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime;
  int wallTime;
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
    wallTime = millis();
  }

  //EXPLOSION 
  void explosion() {
    //ITERATES THROUGH FRAMES
    curFrame = min((millis()-detonateTime-1000)/200+13, 19);
    wallFrame = min((int)((millis()-wallTime-1000)/(200*(7.0/3))+7), 9);
    //STARTS WITH BOMB
    if (curFrame < 13) {
      image(images.get(10), x, y);
    } else {
      //*-------------------------------NORTH ARM---------------------------------*
      //CENTER OF EXPLOSION
      image(images.get(curFrame), x, y);
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[(y - i * per + 2)/per][x/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          image(images.get(wallFrame), x, y - i * per + 2);
          if (wallFrame == 9) {
            wallTime = millis();
            if (Math.random() < .33) {
              dropPowerUp(x, y - i * per);
            } else {
              grid[(y - i * per)/per][x/per] = 5;
            }
          }
          break;
        } else if (y - i * per < 0 || grid[(y - i * per)/per][x/per] == 2) {
          //CHECK BOUNDS
          break;
        } else if (i != s.range) {
          image(images.get(curFrame + 71 - 13), x, y - i * per);
        }
        //FOR TAIL PIECE AND WALL ANIMATION
        else if (i == s.range && grid[(y - i * per)/per][x/per] == 5) {
          image(images.get(curFrame + 31 - 13), x, y - i * per);
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

      //*-------------------------------SOUTH ARM---------------------------------*
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[(y + i * per - 2)/per][x/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          image(images.get(wallFrame), x, y - i * per);
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x, y + i * per);
            } else {
              grid[(y + i * per)/per][x/per] = 5;
            }
          }
          break;
        } else if (y + i * per < 0 || grid[(y + i * per - 2)/per][x/per] == 2) {
          //CHECK BOUNDS
          break;
        } else if (i != s.range) {
          image(images.get(curFrame + 71 - 13), x, y + i * per);
        }
        //FOR TAIL PIECE AND WALL ANIMATION
        if (i == s.range && grid[(y + i * per)/per][x/per] == 5) {
          image(images.get(curFrame + 39 - 13), x, y + i * per);
        } else if (i == s.range && isBreakableBlock(grid[(y + i * per)/per][x/per])) {
          image(images.get(wallFrame), x, y + i * per);
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x, y + i * per);
            } else {
              grid[(y + i * per)/per][x/per] = 5;
            }
          }
        }
      }
      //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
      if (Sprites.size() > 0 && Sprites.get(0).y - per < y && abs(Sprites.get(0).x - x) < 10) {
        Sprites.get(0).t = millis();
        Sprites.get(0).die();
        //REMOVE SPRITE AFTER DIE ANIMATION
        if (Sprites.get(0).curFrame == 24) {
          Sprites.remove(0);
        }
      }

      //*-------------------------------EAST ARM---------------------------------*
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[y/per][(x + i * per)/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          image(images.get(wallFrame), x + i * per, y);
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x + i * per, y);
            } else {
              grid[y/per][(x + i * per)/per] = 5;
            }
          }
          break;
        } else if (x + i * per < 0 || grid[y/per][(x + i * per)/per] == 2) {
          //CHECK BOUNDS
          break;
        } else if (i != s.range) {
          image(images.get(curFrame + 63 - 13), x + i * per, y);
        }
        //FOR TAIL PIECE AND WALL ANIMATION
        if (i == s.range && grid[y/per][(x + i * per)/per] == 5) {
          image(images.get(curFrame + 47 - 13), x + i * per, y);
        } else if (i == s.range && isBreakableBlock(grid[y/per][(x + i * per)/per])) {
          image(images.get(wallFrame), x + i * per, y);
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x + i * per, y);
            } else {
              grid[y/per][(x + i * per)/per] = 5;
            }
          }
        }
      }
      //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
      if (Sprites.size() > 0 && Sprites.get(0).y - per < y && abs(Sprites.get(0).x - x) < 10) {
        Sprites.get(0).t = millis();
        Sprites.get(0).die();
        if (Sprites.get(0).curFrame == 24) {
          Sprites.remove(0);
        }
      }

      //*-------------------------------WEST ARM---------------------------------*
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[y/per][(x - i * per)/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          image(images.get(wallFrame), x - i * per, y);
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x - i * per, y);
            } else {
              grid[y/per][(x - i * per)/per] = 5;
            }
          }
          break;
        } else if (x - i * per < 0 || grid[y/per][(x - i * per)/per] == 2) {
          //CHECK BOUNDS
          break;
        } else if (i != s.range) {
          image(images.get(curFrame + 63 - 13), x - i * per, y);
        }
        //FOR TAIL PIECE AND WALL ANIMATION
        if (i == s.range && grid[y/per][(x - i * per)/per] == 5) {
          image(images.get(curFrame + 55 - 13), x - i * per, y);
        } else if (i == s.range && isBreakableBlock(grid[y/per][(x - i * per)/per])) {
          image(images.get(wallFrame), x - i * per, y);
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x - i * per, y);
            } else {
              grid[y/per][(x - i * per)/per] = 5;
            }
          }
        }
      }
      //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
      if (Sprites.size() > 0 && Sprites.get(0).x + per > x && abs(Sprites.get(0).y - y) < 10) {
        Sprites.get(0).t = millis();
        Sprites.get(0).die();
        if (Sprites.get(0).curFrame == 24) {
          Sprites.remove(0);
        }
      }
    }
  }
}