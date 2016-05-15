import java.lang.Object;
import java.util.*;
class Bombs{
  //List of powerups
  private int lengthOfExplosion;
  private int bombsLeftToDeploy;
  private String specialEffects;
  //general bombs for all players w/o powerups
  Bombs(int LOE, int ammo, String effects){
    lengthOfExplosion= LOE;
    bombsLeftToDeploy = ammo;
    specialEffects = effects;
  }
  Bombs(){
    lengthOfExplosion = 1;
    bombsLeftToDeploy = 1;
    specialEffects = "NONE";
  }
  int getLOE(){
    return lengthOfExplosion;
  }
  int getAmmo(){
    return bombsLeftToDeploy;
  }
  
  //change values of bombs
  //equip players with bombs
  
}