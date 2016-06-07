class Bomb {
  //List of powerups
  int x, y;
  int dropTime;
  int detonateTime;
  int wallTime;
  String name;
  int curFrame;
  int wallFrame;


  //BOMB CONSTRUCTOR
  Bomb(String bombType, int x, int y) {
    this.name = bombType;
    this.x = x;
    this.y = y;
    detonateTime = millis();
    wallTime = millis();
  }

  //EXPLOSION 
  void explosion() {
    //ITERATES THROUGH FRAMES
    //Difference between # of frames * divisor = difference between delay time
    //increasing the delay time causes bomb to start exploding later
    //decreasing the divisor decreases the explosion speed
    curFrame = min((millis()-detonateTime-3000)/150+13, 19);
    wallFrame = min((millis()-detonateTime-3600)/150 + 7, 9);
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
          if (wallFrame < 7) {
            image(images.get(6), x, y - i * per);
          } else {
            image(images.get(wallFrame), x, y - i * per);
          }
          if (wallFrame == 9) {
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
        //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
        if (Sprites.size() > 0 
          && s.y + i * per + per > y
          && s.y < y
          && abs(s.x - x) < 10) {
          if (s.t == 0) {
            s.t = millis();
          }
          print(s.x + " " + (i * per) + " " + x + " " + " north");
          s.die();
          //REMOVE SPRITE AFTER DIE ANIMATION
          if (s.curFrame == 24) {
            Sprites.remove(s);
            gameState = "gameOver";
          }
        }
      }

      //*-------------------------------SOUTH ARM---------------------------------*
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[(y + i * per + 2)/per][x/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          if (wallFrame < 7) {
            image(images.get(6), x, y + i * per);
          } else {
            image(images.get(wallFrame), x, y + i * per);
          }
          if (wallFrame == 9) {
            if (Math.random() < .33) {
              dropPowerUp(x, y + i * per);
            } else {
              grid[(y + i * per)/per][x/per] = 5;
            }
          }
          break;
        } else if (y + i * per < 0 || grid[(y + i * per)/per][x/per] == 2) {
          //CHECK BOUNDS
          break;
        } else if (i != s.range) {
          image(images.get(curFrame + 71 - 13), x, y + i * per);
        }
        //FOR TAIL PIECE AND WALL ANIMATION
        else if (i == s.range && grid[(y + i * per)/per][x/per] == 5) {
          image(images.get(curFrame + 39 - 13), x, y + i * per);
        }
        //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
        if (Sprites.size() > 0 
          && s.y - i * per - per < y 
          && s.y > y
          && abs(s.x - x) < 10) {
          if (s.t == 0) {
            s.t = millis();
          }
          print(s.x + " " + (i * per) + " " + x + " " + " south");
          s.die();
          //REMOVE SPRITE AFTER DIE ANIMATION
          if (s.curFrame == 24) {
            Sprites.remove(s);
            gameState = "gameOver";
          }
        }
      }

      //*-------------------------------EAST ARM---------------------------------*
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[y/per][(x + i * per)/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          if (wallFrame < 7) {
            image(images.get(6), x + i * per, y);
          } else {
            image(images.get(wallFrame), x + i * per, y);
          }
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
        }
        //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
        if (Sprites.size() > 0
          && s.x - i * per - per < x 
          && s.x > x
          && abs(s.y - y) < 20) {
          if (s.t == 0) {
            s.t = millis();
          }
          print(s.x + " " + (i * per) + " " + x + " " + " east");
          s.die();
          //REMOVE SPRITE AFTER DIE ANIMATION
          if (s.curFrame == 24) {
            Sprites.remove(s);
            gameState = "gameOver";
          }
        }
      }

      //*-------------------------------WEST ARM---------------------------------*
      //DISPLAY HORIZONTAL OR VERTICAL EXTENSIONS FOR LONGER RANGE BOMBS
      for (int i = 1; i < s.range + 1; i++) {
        if (grid[y/per][(x - i * per)/per] == 1) {
          //IF EXPLOSION NEXT TO A WALL, IT BREAKS
          if (wallFrame < 7) {
            image(images.get(6), x - i * per, y);
          } else {
            image(images.get(wallFrame), x - i * per, y);
          }
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
        }
        //CHECKS TO SEE IF ARMS HIT THE CHARACTER, RUN SPRITE DIE FUNCTION
        if (Sprites.size() > 0 
          && s.x + i * per > x
          && s.x < x
          && abs(s.y - y) < 20) {
          if (s.t == 0) {
            s.t = millis();
          }
          print(s.x + " " + (i * per) + " " + x + " " + " west");
          s.die();
          //REMOVE SPRITE AFTER DIE ANIMATION
          if (s.curFrame == 24) {
            Sprites.remove(s);
            gameState = "gameOver";
          }
        }
      }
    }
  }
}