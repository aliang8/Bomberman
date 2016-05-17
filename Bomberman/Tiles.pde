import java.lang.Object;
import java.util.*;
class Tiles{
  String name;
  Boolean Destroyable;
  Boolean Alive = true;
private float[][] Map;
public void delete(float X, float Y){
  Map[(int)X][(int)Y] = 0;
}
public Tiles(String Name, Boolean destroy, Boolean deader){
  name = Name;
  Destroyable = destroy;
  Alive = deader;
}
}