class PlayerOne{
  Sprite s;
  boolean[] downKeys;
  
  PlayerOne(Sprite s, boolean[] commands){
    this.s = s;
    downKeys = commands;
  }
  
  void action(){
    if(s.name.equals("red")){
      if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("walkUp")) {
        if(TileMap[(s.y - 3)/per][s.x/per].isOccupied() == true){
          s.y += 10;
        } else {
           s.dir = 'u';
           s.walkMove(0, 4, "walkUp");
        }
      } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
        if(TileMap[s.y/per][(s.x - 3)/per].isOccupied() == true ||
           TileMap[(s.y + 40)/per][(s.x - 3)/per].isOccupied() == true){
           s.x += 10;
        } else{ 
           s.dir = 'l';
           s.walkMove(10, 14, "walkLeft");
        }
      } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("walkDown")) {
        if(TileMap[(s.y + 50)/per][s.x/per].isOccupied() == true){
           s.y -= 10;
        } else {
           s.dir = 'd';
           s.walkMove(5, 9, "walkDown");
        }
      } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       if(TileMap[s.y/per][(s.x + 25)/per].isOccupied() == true || 
          TileMap[(s.y + 40)/per][(s.x + 25)/per].isOccupied() == true){
           s.x -= 10;
        } else {
           s.dir = 'r';
           s.walkMove(15, 19, "walkRight");
        }
      } else if(downKeys['x']){
        grid[s.y/per][s.x/per] = 7;
        if (s.dir == 'u'){
          s.reset(0);
        } else if (s.dir == 'l'){
          s.reset(10);
        } else if (s.dir == 'r'){
          s.reset(15);
        } else {
          s.reset(5);
        }
      } else {
          if (s.dir == 'u'){
            s.reset(0);
          } else if (s.dir == 'l'){
            s.reset(10);
          } else if (s.dir == 'r'){
            s.reset(15);
          } else {
            s.reset(5);
          }
      }
    }
    /*
    if(s.name.equals("blue")){
      if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("walkUp")) {
        if(TileMap[(s.y - 3)/per][s.x/per].isOccupied() == true){
          print("lololol");
        } else {
           s.dir = 'u';
           s.walkMove(24, 28, "walkUp");
        }
      } else if (downKeys['a'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
        if(TileMap[s.y/per][(s.x - 3)/per].isOccupied() == true){
           print("lololol" + " " + s.getX());
        } else{ 
           s.dir = 'l';
           s.walkMove(34, 38, "walkLeft");
        }
      } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("walkDown")) {
        if(TileMap[(s.y + 50)/per][s.x/per].isOccupied() == true){
           print("lololol");
        } else {
           s.dir = 'd';
           s.walkMove(29, 33, "walkDown");
        }
      } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       if(TileMap[s.y/per][(s.x + 25)/per].isOccupied() == true){
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