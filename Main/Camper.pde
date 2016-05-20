public class Camper implements Moveable, Displayable {
  private float x, y, heading, speed;
  private String state;

  public float getX() { 
    return x;
  }
  public float getY() { 
    return y;
  }
  public float getHeading() { 
    return heading;
  }
  public float getSpeed() { 
    return speed;
  }
  public String getState() { 
    return state;
  }
  public void setState(String newState) { 
    state = newState;
  }

  public Camper() {
    state = "MOVING";
    x = width/2;
    y = height/2;
    heading = (int)random(6)*60;
    speed = (1+random(10))/10.0;
  }

  public void move() {
    if (state.equals("MOVING")) {
      x += speed * cos(radians(heading));
      y += speed * sin(radians(heading));
    }else if (state.equals("PATTERN")) {
      //DO SOEMTHING ELSE HERE
      //SOMETIMES CHANGE THE STATE
    }
  }

  public void collide(ArrayList<Positionable> others) {
    if (x > width - 50 || x < 50) {
      heading = (360 + 180 - heading ) % 360;
    }
    if (y > height - 50 || y < 50) {
      heading = (360 - heading);
    }
  }

  public void display() {
    fill(255);
    if (getState().equals("DEAD")) {
      fill(255, 0, 0);
    }
    ellipse(getX(), getY(), 30, 30);
    ellipse(  getX() + 15 * cos(radians(getHeading())), getY() + 15 * sin(radians(getHeading())), 10, 10);
    fill(0);
    text("heading:"+getHeading()+"\nState:"+getState(), getX(), getY());
  }
}