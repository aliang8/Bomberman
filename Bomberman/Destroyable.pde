public interface Destroyable extends Positionable{
  public void delete(float x, float y);
  public void collide(ArrayList<Positionable> others); 
}