
import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  
  public AI(){
    bot.add(new Sprite(500,100,"Yellow"));
    bot.add(new Sprite(500,500,"Green"));
    bot.add(new Sprite(100,500,"Blue"));
  }
  
  void optimalMove(){
   int dir = 0;
   for(Sprite s:bot){
     if (!TileMap[s.makeMove(dir).y/per][(s.makeMove(dir).x+25)/per].isOccupied()){
       s.makeMove(dir);
     }
     dir = 1;
     else if(!TileMap[s.makeMove(dir).y/per][(s.makeMove(dir).x-3)/per].isOccupied()){
       s.makeMove(dir);{
       dir = 1;
     }
       
  
  void makeMove(int number){
    int rand = number;
     for(Sprite s : bot){
       char prev = ' ';
       if(rand ==0){
        if(TileMap[s.y/per][(s.x + 25)/per].isOccupied() == true){
           s.x -= 10;
        }
        else{
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
             prev = 'r';
       }
       }
       else if(rand ==1){
        if(TileMap[s.y/per][(s.x - 3)/per].isOccupied() == true){
           s.x += 10;
        }
           else{
              s.dir = 'l';
              s.walkMove(10, 14, "walkLeft");
              prev = 'l';
        }
       }
       else if( rand ==2){
        if(TileMap[(s.y + 50)/per][s.x/per].isOccupied() == true){
           s.y -= 10;
        }
        else{
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
              prev = 'd';
           }
       }
       else{
        if(TileMap[(s.y - 3)/per][s.x/per].isOccupied() == true){
          s.y += 10;
        }
       else{
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp");
              prev = 'u';
       }

       if(prev == 'r'){
           s.reset(0);
         }
       else if(prev == 'l'){
         s.reset(10);
       }
       else if(prev=='r'){
         s.reset(15);
       }
       else{
         s.reset(5);
     }
     }
}
}