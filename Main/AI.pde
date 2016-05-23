/*
import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  
  public AI(){
    bot.add(new Sprite(700,100,"Yellow"));
    bot.add(new Sprite(700,700,"Green"));
    bot.add(new Sprite(100,700,"Blue"));
  }
  
  void makeMove(){
     for(Sprite s : bot){
       if((TileMap[(int)s.getX()/per][(int)s.getY()/per+1]).getTileType().equals("floor")||
           (TileMap[(int)s.getX()/per][(int)s.getY()/per+1]).getTileType().equals("wood")){
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
           }
        else if((TileMap[(int)s.getX()/per][(int)s.getY()/per-1]).getTileType().equals("floor")||
           (TileMap[(int)s.getX()/per][(int)s.getY()/per-1]).getTileType().equals("wood")){
              s.dir = 'l';
              s.walkMove(10, 14, "walkLeft");
           }
        else if((TileMap[(int)s.getX()/per+1][(int)s.getY()/per]).getTileType().equals("floor")||
           (TileMap[(int)s.getX()/per+1][(int)s.getY()/per+1]).getTileType().equals("wood")){
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
           } 
       else{
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp");
       } 
     }
}
}
*/