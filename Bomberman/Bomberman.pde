String lastKey = "";
boolean keyUsed = false;
String state;
boolean inGame = false;
ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();

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
  
  drawOverlay();
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
  if(keyCode ==" "){
    lastKey = "SPACE";
  }
}
public void handleUserInput() {
  if (keyUsed) {
    if (lastKey.equals("W")) {
      move("up");
    }
    if (lastKey.equals("A")) {
      move("left");
    }
    if (lastKey.equals("S")) {
      move("down");
    }
    if (lastKey.equals("D")) {
      move("right");
    }
    if(lastKey.equals("SPACE")){
      dropBomb();
    }
    //only allow one thing per key press
    keyUsed = false;
  }
}
public void drawOverlay() {
  text("Things that exist: "+thingsThatExist.size(), 20, 20);
  text("Things to display: "+thingsToDisplay.size(), 20, 40);
  text("Things to move: "+thingsToMove.size(), 20, 60);
}
public void setupMenu(){
  //opens up choices for gamemode/level editor
}