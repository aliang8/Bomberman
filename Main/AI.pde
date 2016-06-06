/*
import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  String[] directions = new String[] {"up","left","down","right"};
  public AI(){
    bot.add(new Sprite(500,100,"Yellow"));
    bot.add(new Sprite(500,500,"Green"));
    bot.add(new Sprite(100,500,"Blue"));
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
    for(int i = 0 ; i < 600 / per ; i++) {
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
    
      for(int j = 0 ; j < 800 / per ; j++) {
        if(grid[ai.y/per][j] == 7){
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
            s.dir = 'r';
            s.walkMove(0,4,"walkRight");
        }
        else if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
            s.dir = 'l';
            s.walkMove(10,14,"walkLeft");
        }
        else{
          if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){
            s.dir= 'd';
            s.walkMove(5,9,"walkDown");
          }
        }
    }
      if(direction ==2){
        if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp"); 
          }
          else if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){ 
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
         }
         else{
           if(grid[s.y/per][(s.x+25)/per]!=5||grid[s.y/per][(s.x+25)/per]!=1||grid[s.y/per][(s.x+25)/per]!=3||grid[s.y/per][(s.x+25)/per]!=4){
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
         }
         }
      }
      if(direction == 3){
                if(grid[s.y/per][(s.x+25)/per]!=5||grid[s.y/per][(s.x+25)/per]!=1||grid[s.y/per][(s.x+25)/per]!=3||grid[s.y/per][(s.x+25)/per]!=4){
            s.dir = 'r';
            s.walkMove(0,4,"walkRight");
        }
        else if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
            s.dir = 'l';
            s.walkMove(10,14,"walkLeft");
        }
        else{
          if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp"); 
          }
        }
      }
      if(direction ==4){
                if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp"); 
          }
          else if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){ 
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
         }
         else{
           if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
            s.dir = 'l';
            s.walkMove(10,14,"walkLeft");
        }
         }
      }
        
  }
  }

  void directionMove(Sprite s){
    for(String d : directions){
        
       if(d.equals("right")){
         if(grid[s.y/per][(s.x+25)/per]!=5||grid[s.y/per][(s.x+25)/per]!=1||grid[s.y/per][(s.x+25)/per]!=3||grid[s.y/per][(s.x+25)/per]!=4){
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
         }
             else{
               if(grid[s.y/per][(s.x+25)/per]==3 ||grid[s.y/per][(s.x+25)/per]==4){
                 grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb", s.x/per*per, s.y/per*per));
               }
       }
         }
        else if(d.equals("left")){
          if(grid[s.y/per][(s.x - 3)/per] !=5||grid[s.y/per][(s.x - 3)/per] != 5||grid[s.y/per][(s.x - 3)/per] !=3||grid[s.y/per][(s.x - 3)/per] !=4){
              s.dir = 'l';
              s.walkMove(10, 14, "walkLeft");
          }
          else{
            if(grid[s.y/per][(s.x - 3)/per] == 3||grid[s.y/per][(s.x - 3)/per] == 4){
                 grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb",  s.x/per*per, s.y/per*per));
        }
          }
        }
        else if(d.equals("up")){
          if(grid[(s.y - 3)/per][s.x/per] !=5||grid[(s.y - 3)/per][s.x/per] !=1||grid[(s.y - 3)/per][s.x/per] !=3||grid[(s.y - 3)/per][s.x/per] !=4){
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp"); 
          }
              else{
                if(grid[(s.y - 3)/per][s.x/per] ==3||grid[(s.y - 3)/per][s.x/per] ==4){
                     grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb",s.x/per*per, s.y/per*per));
                }
        }
          }
       else{
         if(grid[(s.y + 50)/per][s.x/per] !=5||grid[(s.y + 50)/per][s.x/per] !=1||grid[(s.y + 50)/per][s.x/per] !=3||grid[(s.y + 50)/per][s.x/per] !=4){ 
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
         }
         else{
           if(grid[(s.y + 50)/per][s.x/per] == 3 || grid[(s.y + 50)/per][s.x/per] == 4){
                                  grid[s.y/per][s.x/per] = 7;
                 BombMap.add(new Bomb("bomb",s.x/per*per, s.y/per*per));
             
       }
         }
       }
       }
     }
      
  void makeMove(){
     for(Sprite s : bot){
       if(nearBy(s)){
         grid[s.y/per][s.x/per] = 7;
         BombMap.add(new Bomb("bomb",s.x, s.y));
       }
       if(bombNearBy(s) > 0){
         avoid(s);
       }
       directionMove(s);
       }
  }
}
*/