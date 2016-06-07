import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  String[] directions = new String[] {"up","left","down","right"};
  public AI(){
      bot.add(new Sprite(52,500,"Yellow"));
    bot.add(new Sprite(600,52,"Green"));
    bot.add(new Sprite(600,500,"Blue"));
  }
  boolean nearBy(Sprite s){
    for(Sprite others : bot){
      if(!(others.name.equals(s.name))){
        if(abs(others.y/per - s.y)/per <= 10 || abs(others.x/per- s.x/per) <=10){
          return true;
        }
      }
    }
    return false;
  }

   int bombNearBy(Sprite ai) {
    int closenessX = 100;
    int closenessY = 100;
    int newClosenessx = 0;
    int newClosenessy = 0;
    int directionx = -1;
    int directiony= -1;
    for(int i = 0 ; i < 600 / per  - 1; i++) {
      if(grid[i][ai.x / per] == 7) {
        closenessY = i - ai.y;
        if(closenessY <= 10 && closenessY > 0) {
          //west
          newClosenessy = closenessY;
          directionx =  2;
        }
        else {
          //east
          newClosenessy = closenessY;
          directionx =  4;
        }
      }
    }
    
      for(int j = 0 ; j < 700 / per  ; j++) {
        if(grid[ai.y/per - 1][j] == 7){
          closenessX = j - ai.x;
          if(closenessX <= 10 && closenessX > 0){
          //north
          newClosenessx = closenessX;
          directiony= 1;
        }
        else {
          //south
          newClosenessx = closenessX;
          directiony= 3;
        }
      }
      //moving in multiple directions might be an issue
      //alternative: return an array with the optimal directions to go in order
      //ex. north is the best way to avoid bomb, but if there's a wall there then
      // go south instead
    //
    if(directionx >0 || directiony >0){
      if(newClosenessx>newClosenessy){
        return directiony;
      }
    }
      }
    return directionx;
   }
 
  //in a seperate method or nah
  void avoid(Sprite s) {
    int direction = bombNearBy(s);
    //move based on what isBombNeraby() returns
    if(direction>0){
      if(direction ==1){
        if(grid[s.y/per][(s.x+25)/per]!=5||grid[s.y/per][(s.x+25)/per]!=1||grid[s.y/per][(s.x+25)/per]!=3||grid[s.y/per][(s.x+25)/per]!=4){
            directionMove(s,3);
        }
        else if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
            directionMove(s,1);
        }
        else{
          if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){
            directionMove(s,2);
          }
        }
    }
      if(direction ==2){
        if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
              directionMove(s,0); 
          }
          else if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){ 
              directionMove(s,2);
         }
         else{
           if(grid[s.y/per][(s.x+25)/per]!=5||grid[s.y/per][(s.x+25)/per]!=1||grid[s.y/per][(s.x+25)/per]!=3||grid[s.y/per][(s.x+25)/per]!=4){
             directionMove(s,3);
         }
         }
      }
      if(direction == 3){
                if(grid[s.y/per][(s.x+25)/per]!=5||grid[s.y/per][(s.x+25)/per]!=1||grid[s.y/per][(s.x+25)/per]!=3||grid[s.y/per][(s.x+25)/per]!=4){
            directionMove(s,3);
        }
        else if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
            directionMove(s,1);
        }
        else{
          if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
              directionMove(s,0);
          }
        }
      }
      if(direction ==4){
                if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
            directionMove(s,0);
          }
          else if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){ 
             directionMove(s,2);
         }
         else{
           if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
            
             directionMove(s,1);
        }
         }
      }
        
  }
  }

  void directionMove(Sprite s, int num){
      String d = directions[num];
      
       if(d.equals("right")){
            s.dir = 'r';
          s.walkMove(15, 19, "walkRight");
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
             else{
               if(grid[s.y/per][(s.x+25)/per]==3 ||grid[s.y/per][(s.x+25)/per]==4){
                 grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb",s.name, s.x/per*per, s.y/per*per));
                 avoid(s);
               }
       }
       }
         
        if(d.equals("left")){
           s.dir = 'l';
          s.walkMove(10, 14, "walkLeft");
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
          else{
            if(grid[s.y/per][(s.x - 3)/per] == 3||grid[s.y/per][(s.x - 3)/per] == 4){
                 grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb", s.name,  s.x/per*per, s.y/per*per));
                 avoid(s);
        }
          }
        }
        if(d.equals("up")){ 
           s.dir = 'u';
          s.walkMove(0, 4, "walkUp");
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
              else{
                if(grid[(s.y - 3)/per][s.x/per] ==3||grid[(s.y - 3)/per][s.x/per] ==4){
                     grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb",s.name, s.x/per*per, s.y/per*per));
                 avoid(s);
                }
        }
          }
       else{
              s.dir = 'd';
          s.walkMove(5, 9, "walkDown");
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
         else{
           if(grid[(s.y + 50)/per][s.x/per] == 3 || grid[(s.y + 50)/per][s.x/per] == 4){
                                  grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb",s.name,s.x/per*per, s.y/per*per));
                 avoid(s);
             
       }
         }
       
       }
        }
  
  void makeMove(){
     for(Sprite s : bot){
       if(nearBy(s)){
         if(grid[(s.y)/per][(s.x)/per]==5){
         grid[s.y/per][s.x/per] = 7;
         BombMap.add(new Bomb("bomb",s.name, s.x, s.y));
       }
       }
       if(bombNearBy(s) >= 0){
         avoid(s);
       }
       else{
         int r = int(random(4));
         directionMove(s,r);
         }

       
       
  }
}
  
}