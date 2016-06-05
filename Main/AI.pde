import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  String[] directions = new String[] {"up","left","down","right"};
  ArrayList<integer>nearByBombCors = new ArrayList<integer>();
  public AI(){
    bot.add(new Sprite(500,100,"Yellow"));
    bot.add(new Sprite(500,500,"Green"));
    bot.add(new Sprite(100,500,"Blue"));
  }
  boolean nearBy(Sprite s){
    for(Sprite others : bot){
      if(!(otheres.getName().equals(s.getName()))){
        if(abs(others.getY()/per - s.getY())/per <= 10 || abs(others.getX()/per- s.getX()/per) <=10){
          return true;
        }
      }
    }
  }

  boolean bombNearBy(Sprite s){
    int closeness = 100;
    for(int i = 0; i < 600/per; i++){
      if(grid[i][s.getX()/per]==7){
        closeness = abs(i-s.getY());
        if(closeness <=10){
         
      }
    }
    for(int j = 0; j < 800/per; j ++){
      if(grid[s.getY()][j]==7){
        int closeness = abs(i-s.getX());
      }
    }
    if(closeness <=10){
      return true;
    }
    else{
      return false;
    }
  }
  void moveToSafety(Sprite s){
    if(bombNearBy(s)){
      
  int getScore(Sprite s){
    int score = 0;
    if(nearBy(s)){
      score ++;
    }
    if(
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
                 BombMap.add(new Bomb("bomb", false, s.x/per*per, s.y/per*per));
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
                 BombMap.add(new Bomb("bomb", false, s.x/per*per, s.y/per*per));
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
                 BombMap.add(new Bomb("bomb", false, s.x/per*per, s.y/per*per));
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
                 BombMap.add(new Bomb("bomb", false, s.x/per*per, s.y/per*per));
             
       }
         }
       }
       }
     }
      
  void makeMove(){
     for(Sprite s : bot){
       for(String d : directions){
       }
     }
  }
}