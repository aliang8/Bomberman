class Players implements Moveable,Destroyable,Displayable{
  Bombs inHand;
  private float x,y,heading,speed;
  private String state;
  void move(){
  }
  void collide(){
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