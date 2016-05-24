
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
       print(rand);
       frameRate(20);
       if(rand ==0){
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
           }
        else if(rand==1){
              s.dir = 'l';
              s.walkMove(10, 14, "walkLeft");
           }
        else if(rand ==2){
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