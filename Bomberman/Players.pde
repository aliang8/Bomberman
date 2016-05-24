class Players implements Moveable,Destroyable,Displayable{
    private Bombs inHand;
    private float x,y,heading,speed;
    private String state;
    private PImage playerImage;
  public void move(){
      if(Math.random()* 4 == 0){
      x+= 1;
      }
      else if(Math.random()*4 ==1){
        x-=1;
      }
      else if (Math.random()*4 ==2){
        y+=1;
      }
      else{
        y -= 1;
      }
    }
  public void collide(ArrayList<Positionable> others){
  }
  public void display(){
  }
  public void delete(float x, float y){
  }
    
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getHeading(){
    return heading;
  }
  public String getState(){
    return state;
  }
  public int getinHand(){
    return inHand.getAmmo();
  }
  public void setState(String newState){
    state = newState;
  }
  public Players(){//default players to one of the four corners
    state = "ALIVE";
  }
  public void move(String direction){
    if(direction.equals("up")){
      y += 1;
    } else if (direction.equals("down")){
      y -= 1;
    } else if (direction.equals("left")){
      x -= 1;
    } else if (direction.equals("right")){
      x += 1;
    }
  }
  public void dropBomb(){
    
}
}