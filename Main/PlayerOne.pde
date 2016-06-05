class PlayerOne {
  Sprite s;
  boolean[] downKeys;

  //PLAYERONE INITIALIZATION
  PlayerOne(Sprite s, boolean[] commands) {
    this.s = s;
    downKeys = commands;
  }

  //PLAYERONE DOES THIS:
  void action() {
    //ONLY FOR RED PLAYER!
    if (!s.state.equals("dying")) {
      s.losePowerUp();
      if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("walkUp")) {
        //WALK UP
        //OBJECT COLLISION CHECK FOR A BLOCK ABOVE CHARACTER
        if (isBlock(grid[(s.y - 1)/per][(s.x + 22)/per]) 
          || isBlock(grid[(s.y - 1)/per][(s.x + 3)/per]) 
          || (closestBomb() != null && (millis() - closestBomb().detonateTime < 1000))) {
          s.y += s.STEP;
          //CHECK TO SEE IF TILE CONTAINS POWERUP
        } else if (isPowerUp(grid[(s.y - 1)/per][(s.x + 24)/per])) {
          s.obtainPU(s.x + 24, s.y - 1); 
          //CHANGE IT BACK TO FLOOR TILE
          grid[(s.y - 1)/per][(s.x + 24)/per] = 5;
        } else if (isPowerUp(grid[(s.y - 1)/per][s.x/per])) {
          s.obtainPU(s.x + 24, s.y - 1); 
          grid[(s.y - 1)/per][s.x/per] = 5;
        }
        s.dir = 'u';
        s.walkMove(0, 4, "walkUp");
      } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
        //WALK LEFT
        //OBJECT COLLISION CHECK FOR A BLOCK TO THE LEFT OF CHARACTER
        if (isBlock(grid[(s.y + 42)/per][(s.x - 1)/per]) 
          || isBlock(grid[(s.y + 3)/per][(s.x - 1)/per])
          || (closestBomb() != null && (millis() - closestBomb().detonateTime < 1000))) {
          s.x += s.STEP;
        } else if (isPowerUp(grid[(s.y + 44)/per][(s.x - 3)/per])) {
          s.obtainPU(s.x - 3, s.y + 44); 
          grid[(s.y + 44)/per][(s.x - 3)/per] = 5;
        } else if (isPowerUp(grid[(s.y + 4)/per][(s.x - 3)/per])) {
          s.obtainPU(s.x - 3, s.y + 44); 
          grid[(s.y + 4)/per][(s.x - 3)/per] = 5;
        }
        s.dir = 'l';
        s.walkMove(10, 14, "walkLeft");
      } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("walkDown")) {
        //WALK DOWN 
        //OBJECT COLLISION CHECK FOR A BLOCK BELOW CHARACTER
        if (isBlock(grid[(s.y + 47)/per][(s.x + 12)/per]) 
          || isBlock(grid[(s.y + 47)/per][(s.x + 3)/per])
          || (closestBomb() != null && (millis() - closestBomb().detonateTime < 1000))) {
          s.y -= s.STEP;
        } else if (isPowerUp(grid[(s.y + 47)/per][(s.x + 12)/per])) {
          s.obtainPU(s.x + 12, s.y + 47); 
          grid[(s.y + 47)/per][(s.x + 12)/per] = 5;
        } else if (isPowerUp(grid[(s.y + 47)/per][s.x/per])) {
          s.obtainPU(s.x + 12, s.y + 47); 
          grid[(s.y + 47)/per][s.x/per] = 5;
        }
        s.dir = 'd';
        s.walkMove(5, 9, "walkDown");
      } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
        //WALK RIGHT
        //OBJECT COLLISION CHECK FOR A BLOCK TO THE RIGHT OF CHARACTER
          if (isBlock(grid[(s.y + 42)/per][(s.x + 27)/per]) 
            || isBlock(grid[(s.y + 3)/per][(s.x + 27)/per])
            || (closestBomb() != null && (millis() - closestBomb().detonateTime < 1000))) {
            s.x -= s.STEP;
          } else if (isPowerUp(grid[(s.y + 44)/per][(s.x + 27)/per])) {
            s.obtainPU(s.x + 27, s.y + 44); 
            grid[(s.y + 44)/per][(s.x + 27)/per] = 5;
          } else if (isPowerUp(grid[(s.y + 4)/per][(s.x + 27)/per])) {
            s.obtainPU(s.x + 27, s.y + 44); 
            grid[(s.y + 4)/per][(s.x + 27)/per] = 5;
          }
          s.dir = 'r';
          s.walkMove(15, 19, "walkRight");
      } else if (downKeys['x']) {
        //DROP BOMB WHEN PRESS X
        //CHECK TO MAKE SURE YOU ARE DROPPING ON FLOOR 
        if (s.numBombs > 0 && BombMap.size() < maxBombsOnBoard) {
          if (grid[(s.y + 25)/per][(s.x + 25)/per] == 5 || grid[(s.y + 25)/per][(s.x + 25)/per] == 1) {
            grid[(s.y + 25)/per][(s.x + 25)/per] = 7;
            BombMap.add(new Bomb("bomb", (s.x + 25)/per*per, (s.y + 25)/per*per));
            s.numBombs--;
          }
        }
        //RESETS CHARACTER DIRECTION
        if (s.dir == 'u') {
          s.reset(0);
        } else if (s.dir == 'l') {
          s.reset(10);
        } else if (s.dir == 'r') {
          s.reset(15);
        } else {
          s.reset(5);
        }
      } else {
        if (s.dir == 'u') {
          s.reset(0);
        } else if (s.dir == 'l') {
          s.reset(10);
        } else if (s.dir == 'r') {
          s.reset(15);
        } else {
          s.reset(5);
        }
      }
    }
  }
}