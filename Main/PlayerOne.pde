class PlayerOne {
  Sprite s;
  boolean[] downKeys;

  PlayerOne(Sprite s, boolean[] commands) {
    this.s = s;
    downKeys = commands;
  }
  boolean isBlock(int x) {
    return (x == 1 || x == 2 || x == 3 || x == 4 || x == 6);
  }
  boolean isPowerUp(int x) {
    return (x == 8 || x == 9 || x == 10 || x == 11 || x == 12 || x == 13 || x == 14 || x == 15 || x == 16 || x == 17);
  }
  void obtainPU(int x, int y){
    int powerUp = grid[y/per][x/per];
    switch (powerUp) {
      case 8:
        print("Picked up boots");
        s.STEP += 2;
      case 9:
        print("Picked up some slime");
        s.STEP -= 3;
      case 10:
        print("More bombs");
        s.numBombs = 3;
      case 11:
        print(
  void action() {
    if (s.name.equals("red") && !s.curMove.equals("dying")) {
      if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("walkUp")) {
        if (isBlock(grid[(s.y - 1)/per][(s.x + 24)/per]) || isBlock(grid[(s.y - 1)/per][s.x/per])) {
          s.y += s.STEP;
        } else if (isPowerUp(grid[(s.y - 1)/per][(s.x + 24)/per])) {
          s.obtainPU(); 
          grid[(s.y - 1)/per][(s.x + 24)/per] = 5;
        } else if (isPowerUp(grid[(s.y - 1)/per][s.x/per])) {
          s.obtainPU(); 
          grid[(s.y - 1)/per][s.x/per] = 5;
        }
        s.dir = 'u';
        s.walkMove(0, 4, "walkUp");
      } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
        if (isBlock(grid[(s.y + 44)/per][(s.x - 3)/per]) || isBlock(grid[(s.y + 4)/per][(s.x - 3)/per])) {
          s.x += s.STEP;
        } else if (isPowerUp(grid[(s.y + 44)/per][(s.x - 3)/per])) {
          s.obtainPU(); 
          grid[(s.y + 44)/per][(s.x - 3)/per] = 5;
        } else if (isPowerUp(grid[(s.y + 4)/per][(s.x - 3)/per])) {
          s.obtainPU(); 
          grid[(s.y + 4)/per][(s.x - 3)/per] = 5;
        }
        s.dir = 'l';
        s.walkMove(10, 14, "walkLeft");
      } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("walkDown")) {
        if (isBlock(grid[(s.y + 47)/per][(s.x + 12)/per]) || isBlock(grid[(s.y + 47)/per][s.x/per])) {
          s.y -= s.STEP;
        } else if (isPowerUp(grid[(s.y + 47)/per][(s.x + 12)/per])) {
          s.obtainPU(); 
          grid[(s.y + 47)/per][(s.x + 12)/per] = 5;
        } else if (isPowerUp(grid[(s.y + 47)/per][s.x/per])) {
          s.obtainPU(); 
          grid[(s.y + 47)/per][s.x/per] = 5;
        }
        s.dir = 'd';
        s.walkMove(5, 9, "walkDown");
      } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
        if (isBlock(grid[(s.y + 44)/per][(s.x + 27)/per]) || isBlock(grid[(s.y + 4)/per][(s.x + 27)/per])) {
          s.x -= s.STEP;
        } else if (isPowerUp(grid[(s.y + 44)/per][(s.x + 27)/per])) {
          s.obtainPU(); 
          grid[(s.y + 44)/per][(s.x + 27)/per] = 5;
        } else if (isPowerUp(grid[(s.y + 4)/per][(s.x + 27)/per])) {
          s.obtainPU(); 
          grid[(s.y + 4)/per][(s.x + 27)/per] = 5;
        }
        s.dir = 'r';
        s.walkMove(15, 19, "walkRight");
      } else if (downKeys['x']) {
        //print(s.y);
        print(s.STEP);
        if (grid[(s.y - 5)/per][s.x/per] == 5 || grid[(s.y - 5)/per][s.x/per] == 1) {
          //print(grid[(s.y + 2)/per][s.x/per]);
          grid[(s.y + 2)/per][s.x/per] = 7;
          //BombMap.add(new Bomb("bomb", false, s.x/per, s.y/per + per));
        }
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
    /*
    if(s.name.equals("blue")){
     if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("walkUp")) {
     if(grid[(s.y - 3)/per][s.x/per].isOccupied() == true){
     print("lololol");
     } else {
     s.dir = 'u';
     s.walkMove(24, 28, "walkUp");
     }
     } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
     if(grid[s.y/per][(s.x - 3)/per].isOccupied() == true){
     print("lololol" + " " + s.getX());
     } else{ 
     s.dir = 'l';
     s.walkMove(34, 38, "walkLeft");
     }
     } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("walkDown")) {
     if(grid[(s.y + 50)/per][s.x/per].isOccupied() == true){
     print("lololol");
     } else {
     s.dir = 'd';
     s.walkMove(29, 33, "walkDown");
     }
     } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
     if(grid[s.y/per][(s.x + 25)/per].isOccupied() == true){
     print("lololol" + " " + s.getX());
     } else {
     s.dir = 'r';
     s.walkMove(39, 43, "walkRight");
     }
     } else if(downKeys['x']){
     grid[s.y/per][s.x/per] = 7;
     if (s.dir == 'u'){
     s.reset(24);
     } else if (s.dir == 'l'){
     s.reset(34);
     } else if (s.dir == 'r'){
     s.reset(39);
     } else {
     s.reset(29);
     }
     } else {
     if (s.dir == 'u'){
     s.reset(24);
     } else if (s.dir == 'l'){
     s.reset(34);
     } else if (s.dir == 'r'){
     s.reset(39);
     } else {
     s.reset(29);
     }
     }
     }
     */
  }
}