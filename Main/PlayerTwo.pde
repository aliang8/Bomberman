class PlayerTwo {
  Sprite s2;
  boolean[] downKeys2;

  //PLAYERONE INITIALIZATION
  PlayerTwo(Sprite s2, boolean[] commands) {
    this.s2 = s2;
    downKeys2 = commands;
  }

  //PLAYERONE DOES THIS:
  void action() {
    //ONLY FOR RED PLAYER!
    if (!s2.state.equals("dying")) {
      s2.losePowerUp2();
      if (downKeys2[259] && s2.curMove.equals("") || s2.curMove.equals("walkUp")) {
        //WALK UP
        //OBJECT COLLISION CHECK FOR A BLOCK ABOVE CHARACTER
        if (isBlock(grid[(s2.y - 1)/per][(s2.x + 22)/per]) 
          || isBlock(grid[(s2.y - 1)/per][(s2.x + 3)/per]) 
          || (closestBomb2() != null && (millis() - closestBomb2().detonateTime >= 1000))) {
          s2.y += s2.STEP;
          //CHECK TO SEE IF TILE CONTAINS POWERUP
        } else if (isPowerUp(grid[(s2.y - 1)/per][(s2.x + 24)/per])) {
          s2.obtainPU2(s2.x + 24, s2.y - 1); 
          //CHANGE IT BACK TO FLOOR TILE
          grid[(s2.y - 1)/per][(s2.x + 24)/per] = 5;
        } else if (isPowerUp(grid[(s2.y - 1)/per][s2.x/per])) {
          s2.obtainPU2(s2.x + 24, s2.y - 1); 
          grid[(s2.y - 1)/per][s2.x/per] = 5;
        }
        if (s2.name.equals("red")) {
          s2.dir = 'u';
          s2.walkMove(0, 4, "walkUp");
        } else if (s2.name.equals("blue")) {
          s2.dir = 'u';
          s2.walkMove(25, 29, "walkUp");
        } else if (s2.name.equals("yellow")) {
          s2.dir = 'u';
          s2.walkMove(50, 54, "walkUp");
        } else if (s2.name.equals("green")) {
          s2.dir = 'u';
          s2.walkMove(75, 79, "walkUp");
        }
      } else if (downKeys2[257] && s2.curMove.equals("") || s2.curMove.equals("walkLeft")) {
        //WALK LEFT
        //OBJECT COLLISION CHECK FOR A BLOCK TO THE LEFT OF CHARACTER
        if (isBlock(grid[(s2.y + 42)/per][(s2.x - 1)/per]) 
          || isBlock(grid[(s2.y + 3)/per][(s2.x - 1)/per])
          || (closestBomb2() != null && (millis() - closestBomb2().detonateTime >= 1000))) {
          s2.x += s2.STEP;
        } else if (isPowerUp(grid[(s2.y + 44)/per][(s2.x - 3)/per])) {
          s2.obtainPU2(s2.x - 3, s2.y + 44); 
          grid[(s2.y + 44)/per][(s2.x - 3)/per] = 5;
        } else if (isPowerUp(grid[(s2.y + 4)/per][(s2.x - 3)/per])) {
          s2.obtainPU2(s2.x - 3, s2.y + 44); 
          grid[(s2.y + 4)/per][(s2.x - 3)/per] = 5;
        }
        if (s2.name.equals("red")) {
          s2.dir = 'l';
          s2.walkMove(10, 14, "walkLeft");
        } else if (s2.name.equals("blue")) {
          s2.dir = 'l';
          s2.walkMove(35, 39, "walkLeft");
        } else if (s2.name.equals("yellow")) {
          s2.dir = 'l';
          s2.walkMove(60, 64, "walkLeft");
        } else if (s2.name.equals("green")) {
          s2.dir = 'l';
          s2.walkMove(85, 89, "walkLeft");
        }
      } else if (downKeys2[258] && s2.curMove.equals("") || s2.curMove.equals("walkDown")) {
        //WALK DOWN 
        //OBJECT COLLISION CHECK FOR A BLOCK BELOW CHARACTER
        if (isBlock(grid[(s2.y + 47)/per][(s2.x + 12)/per]) 
          || isBlock(grid[(s2.y + 47)/per][(s2.x + 3)/per])
          || (closestBomb2() != null && (millis() - closestBomb2().detonateTime >= 1000))) {
          s2.y -= s2.STEP;
        } else if (isPowerUp(grid[(s2.y + 47)/per][(s2.x + 12)/per])) {
          s2.obtainPU2(s2.x + 12, s2.y + 47); 
          grid[(s2.y + 47)/per][(s2.x + 12)/per] = 5;
        } else if (isPowerUp(grid[(s2.y + 47)/per][s2.x/per])) {
          s2.obtainPU2(s2.x + 12, s2.y + 47); 
          grid[(s2.y + 47)/per][s2.x/per] = 5;
        }
        if (s2.name.equals("red")) {
          s2.dir = 'd';
          s2.walkMove(5, 9, "walkDown");
        } else if (s2.name.equals("blue")) {
          s2.dir = 'd';
          s2.walkMove(30, 34, "walkDown");
        } else if (s2.name.equals("yellow")) {
          s2.dir = 'd';
          s2.walkMove(55, 59, "walkDown");
        } else if (s2.name.equals("green")) {
          s2.dir = 'd';
          s2.walkMove(80, 84, "walkDown");
        }
      } else if (downKeys2[256] && s2.curMove.equals("") || s2.curMove.equals("walkRight")) {
        //WALK RIGHT
        //OBJECT COLLISION CHECK FOR A BLOCK TO THE RIGHT OF CHARACTER
        if (isBlock(grid[(s2.y + 42)/per][(s2.x + 27)/per]) 
          || isBlock(grid[(s2.y + 3)/per][(s2.x + 27)/per])
          || (closestBomb2() != null && (millis() - closestBomb2().detonateTime >= 1000))) {
          s2.x -= s2.STEP;
        } else if (isPowerUp(grid[(s2.y + 44)/per][(s2.x + 27)/per])) {
          s2.obtainPU2(s2.x + 27, s2.y + 44); 
          grid[(s2.y + 44)/per][(s2.x + 27)/per] = 5;
        } else if (isPowerUp(grid[(s2.y + 4)/per][(s2.x + 27)/per])) {
          s2.obtainPU2(s2.x + 27, s2.y + 44); 
          grid[(s2.y + 4)/per][(s2.x + 27)/per] = 5;
        }
        if (s2.name.equals("red")) {
          s2.dir = 'r';
          s2.walkMove(15, 19, "walkRight");
        } else if (s2.name.equals("blue")) {
          s2.dir = 'r';
          s2.walkMove(40, 44, "walkRight");
        } else if (s2.name.equals("yellow")) {
          s2.dir = 'r';
          s2.walkMove(65, 69, "walkRight");
        } else if (s2.name.equals("green")) {
          s2.dir = 'r';
          s2.walkMove(90, 94, "walkRight");
        }
      } else if (downKeys2['/']) {
        //DROP BOMB WHEN PRESS
        //CHECK TO MAKE SURE YOU ARE DROPPING ON FLOOR 
        if (s2.numBombs > 0 && BombMap.size() < t1.maxBombsOnBoard) {
          if (grid[(s2.y + 25)/per][(s2.x + 25)/per] == 5 || grid[(s2.y + 25)/per][(s2.x + 25)/per] == 1) {
            grid[(s2.y + 25)/per][(s2.x + 25)/per] = 7;
            BombMap.add(new Bomb("bomb", "PlayerTwo", (s2.x + 25)/per*per, (s2.y + 25)/per*per));
            s2.numBombs--;
          }
        }
        //RESETS CHARACTER DIRECTION
        if (s2.dir == 'u' && s2.name.equals("red")) {
          s2.reset(0);
        } else if (s2.dir == 'u' && s2.name.equals("blue")) {
          s2.reset(25);
        } else if (s2.dir == 'u' && s2.name.equals("yellow")) {
          s2.reset(50);
        } else if (s2.dir == 'u' && s2.name.equals("green")) {
          s2.reset(75);
        } else if (s2.dir == 'l' && s2.name.equals("red")) {
          s2.reset(10);
        } else if (s2.dir == 'l' && s2.name.equals("blue")) {
          s2.reset(35);
        } else if (s2.dir == 'l' && s2.name.equals("yellow")) {
          s2.reset(60);
        } else if (s2.dir == 'l' && s2.name.equals("green")) {
          s2.reset(85);
        } else if (s2.dir == 'r' && s2.name.equals("red")) {
          s2.reset(15);
        } else if (s2.dir == 'r' && s2.name.equals("blue")) {
          s2.reset(40);
        } else if (s2.dir == 'r' && s2.name.equals("yellow")) {
          s2.reset(65);
        } else if (s2.dir == 'r' && s2.name.equals("green")) {
          s2.reset(90);
        } else if (s2.dir == 'd' && s2.name.equals("red")) {
          s2.reset(5);
        } else if (s2.dir == 'd' && s2.name.equals("blue")) {
          s2.reset(30);
        } else if (s2.dir == 'd' && s2.name.equals("yellow")) {
          s2.reset(55);
        } else if (s2.dir == 'd' && s2.name.equals("green")) {
          s2.reset(80);
        }
      } else {
        if (s2.dir == 'u' && s2.name.equals("red")) {
          s2.reset(0);
        } else if (s2.dir == 'u' && s2.name.equals("blue")) {
          s2.reset(25);
        } else if (s2.dir == 'u' && s2.name.equals("yellow")) {
          s2.reset(50);
        } else if (s2.dir == 'u' && s2.name.equals("green")) {
          s2.reset(75);
        } else if (s2.dir == 'l' && s2.name.equals("red")) {
          s2.reset(10);
        } else if (s2.dir == 'l' && s2.name.equals("blue")) {
          s2.reset(35);
        } else if (s2.dir == 'l' && s2.name.equals("yellow")) {
          s2.reset(60);
        } else if (s2.dir == 'l' && s2.name.equals("green")) {
          s2.reset(85);
        } else if (s2.dir == 'r' && s2.name.equals("red")) {
          s2.reset(15);
        } else if (s2.dir == 'r' && s2.name.equals("blue")) {
          s2.reset(40);
        } else if (s2.dir == 'r' && s2.name.equals("yellow")) {
          s2.reset(65);
        } else if (s2.dir == 'r' && s2.name.equals("green")) {
          s2.reset(90);
        } else if (s2.dir == 'd' && s2.name.equals("red")) {
          s2.reset(5);
        } else if (s2.dir == 'd' && s2.name.equals("blue")) {
          s2.reset(30);
        } else if (s2.dir == 'd' && s2.name.equals("yellow")) {
          s2.reset(55);
        } else if (s2.dir == 'd' && s2.name.equals("green")) {
          s2.reset(80);
        }
      }
    }
  }
}