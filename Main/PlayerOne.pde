class PlayerOne{
  Sprite s;
  boolean[] downKeys;
  
  PlayerOne(Sprite s, boolean[] commands){
    this.s = s;
    downKeys = commands;
  }
  
  void action(){
    if(s.name.equals("fighter1")){
      if (downKeys['w'] && s.curMove.equals("") || s.curMove.equals("walkUp")) {
        if(TileMap[(s.y - 3)/per][s.x/per].isOccupied() == true){
          print("lololol");
        } else {
           s.dir = 'u';
           s.walkMove(0, 4, "walkUp");
        }
      } else if (downKeys['l'] && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
        if(TileMap[s.y/per][(s.x - 3)/per].isOccupied() == true){
           print("lololol" + " " + s.getX());
        } else{ 
           s.dir = 'l';
           s.walkMove(10, 14, "walkLeft");
        }
      } else if (downKeys['s'] && s.curMove.equals("") || s.curMove.equals("walkDown")) {
        if(TileMap[(s.y + 58)/per][s.x/per].isOccupied() == true){
           print("lololol");
        } else {
           s.dir = 'd';
           s.walkMove(5, 9, "walkDown");
        }
      } else if (downKeys['d'] && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       if(TileMap[s.y/per][(s.x + 25)/per].isOccupied() == true){
           print("lololol" + " " + s.getX());
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
  }
}