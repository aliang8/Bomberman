
import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  
  public AI(){
    bot.add(new Sprite(500,100,"Yellow"));
    bot.add(new Sprite(500,500,"Green"));
    bot.add(new Sprite(100,500,"Blue"));
  }
  
  void makeMove(){
     for(Sprite s : bot){
       int rand =(int)random(4);
       char prev = ' ';
       if(rand ==0){
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
             prev = 'r';
       }
        else if(rand==1){
              s.dir = 'l';
              s.walkMove(10, 14, "walkLeft");
              prev = 'l';
        }
        else if(rand ==2){
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
              prev = 'd';
        }
       else{
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp"); 
              prev = 'u';
       }
       if(prev=='r'){
         s.reset(15);
       }
       else if(prev == 'l'){
         s.reset(10);
       }
       else if(prev == 'u'){
         s.reset(0);
       }
       else{
         s.reset(5);
       }
     }
}
}