import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  String[] directions = new String[] {"up","left","down","right"};
  public AI(){
    bot.add(new Sprite(500,100,"Yellow"));
    bot.add(new Sprite(500,500,"Green"));
    bot.add(new Sprite(100,500,"Blue"));
  }
  void makeMove(){
     for(Sprite s : bot){
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
}
}