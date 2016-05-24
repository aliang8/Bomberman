
import java.lang.Object;
class AI{
  ArrayList<Sprite> bot = new ArrayList<Sprite>();
  ArrayList < PImage > images;
  
  public AI(){
    bot.add(new Sprite(700,100,"Yellow"));
    bot.add(new Sprite(700,700,"Green"));
    bot.add(new Sprite(100,700,"Blue"));
          images = new ArrayList<PImage>();
      for (int i = 1; i < 25; i++){
        String imageName = "Yellow" + "(" + i + ").gif";
        images.add(loadImage(imageName));
        images.get(i-1).resize(25,50);
      }
       for (int i = 1; i < 25; i++){
        String imageName = "Green" + "(" + i + ").gif";
        images.add(loadImage(imageName));
        images.get(i-1).resize(25,50);
      }
       for (int i = 1; i < 25; i++){
        String imageName = "Blue" + "(" + i + ").gif";
        images.add(loadImage(imageName));
        images.get(i-1).resize(25,50);
      }
  }
  
  void makeMove(){
     for(Sprite s : bot){
       if((int)Math.random()*4 == 0){
       if((TileMap[(int)s.getX()/per][(int)s.getY()/per+1]).getTileType().equals("floor")||
           (TileMap[(int)s.getX()/per][(int)s.getY()/per+1]).getTileType().equals("wood")){
             s.dir = 'r';
             s.walkMove(0, 4, "walkRight");
           }
       }
       else if((int)Math.random()*4 ==1){
        if((TileMap[(int)s.getX()/per][(int)s.getY()/per-1]).getTileType().equals("floor")||
           (TileMap[(int)s.getX()/per][(int)s.getY()/per-1]).getTileType().equals("wood")){
              s.dir = 'l';
              s.walkMove(10, 14, "walkLeft");
           }
       }
       else if((int)Math.random()*4 == 2){
        if((TileMap[(int)s.getX()/per+1][(int)s.getY()/per]).getTileType().equals("floor")||
           (TileMap[(int)s.getX()/per+1][(int)s.getY()/per+1]).getTileType().equals("wood")){
              s.dir = 'd';
              s.walkMove(5, 9, "walkDown");
           } 
       }
       else{
              s.dir = 'u';
              s.walkMove(0, 4, "walkUp");
       } 
     }
}
}