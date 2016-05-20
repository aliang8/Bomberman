public class EvilCamper extends Camper {

  public void display() {
    fill(100, 200, 100);
    ellipse(getX(), getY(), 30, 30);
    fill(255, 0, 0);
    ellipse(  getX() + 15 * cos(radians(getHeading())), getY() + 15 * sin(radians(getHeading())), 10, 10);
    fill(0);
    text("heading:"+getHeading(), getX(), getY());
  }

  public void collide(ArrayList<Positionable> others) {
    super.collide(others);
    //kill the campers here!
    for (Positionable c : others) {
      if ( c != this ) {
        if (c.getState().equals("MOVING") && dist(this.getX(),this.getY(),c.getX(),c.getY()) < 20.0) {
          c.setState("DEAD");
        }
      }
    }
  }
}