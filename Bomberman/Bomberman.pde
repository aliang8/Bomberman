String lastKey = "";
PImage map = loadImage("defaultmap.png");
PImage menu = loadImage();
boolean keyUsed = false;
String state;
boolean inGame = false;
ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();
ArrayList<Players> PlayersOnMap = new ArrayList<Players>();
public void setup(){
  size(640,576);
  background(255,255,255);
  state = "menu";
}
public void draw(){
  handleUserInput();
  for( Moveable m : thingsToMove){
    m.move();
    m.collide(thingsThatExist);
  }
  background(255);
  for(Displayable d : thingsToDisplay){
    d.display();
  }
  if(state.equals("menu")){
    setupMenu();
  }
  if(inGame){
    displayMap();
  }
}

void displayMap(){
  image(map,0,0);
}
void setupMenu(){
}
  

public void keyPressed() {
  print(keyCode+",");
  keyUsed = true;
  //WASD
  if (keyCode == 65){ //A
    lastKey = "A";
  }
  if (keyCode == 68) { //D
    lastKey = "D";
  }
  if (keyCode == 87) { //W
    lastKey = "W";
  }
  if (keyCode == 83) { //S
    lastKey = "S";
  }
  if(keyCode == ' '){
    lastKey = "SPACE";
  }
}
public void handleUserInput() {
  if (keyUsed) {
    if (lastKey.equals("W")) {
      PlayersOnMap.get(1).move("up");
    }
    if (lastKey.equals("A")) {
      PlayersOnMap.get(1).move("left");
    }
    if (lastKey.equals("S")) {
      PlayersOnMap.get(1).move("down");
    }
    if (lastKey.equals("D")) {
      PlayersOnMap.get(1).move("right");
    }
    if(lastKey.equals("SPACE")){
      PlayersOnMap.get(1).dropBomb();
    }
    //only allow one thing per key press
    keyUsed = false;
  }
}