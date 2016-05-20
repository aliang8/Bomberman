ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();
EvilCamper player = new EvilCamper();
String lastKey = "";
boolean keyUsed = false;

public void setup() {
  size(600, 400);

  for (int i = 0; i < 10; i++) {
    Camper c = new Camper();
    thingsToMove.add(c);
    thingsToDisplay.add(c);
    thingsThatExist.add(c);
  }
  thingsToMove.add(player);
  thingsToDisplay.add(player);
  thingsThatExist.add(player);
}

public void keyPressed() {
  print(keyCode+",");
  keyUsed = true;
  //WASD
  if (keyCode == 65) { //A
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
}

public void mouseClicked() {
  delete(mouseX, mouseY);
}

public void delete(float x, float y) {
  for (int i = thingsThatExist.size() - 1; i>=0; i-- ) {
    Positionable p = thingsThatExist.get(i);
    if ( dist(x, y, p.getX(), p.getY())<20) {
      p.setState("REMOVE");
    }
  }
}

public void draw() {
  /***********************************************
  get user input
  */
  handleUserInput();

  /************************************************
  *change object states
   */
  for ( Moveable m : thingsToMove) {
    //move objects
    m.move();
    //check for collisions/events
    m.collide(thingsThatExist);
  }

  /************************************************
  *draw objects
   */  
  //clear the world
  background(255);
  //draw things
  for ( Displayable d : thingsToDisplay) {
    d.display();
  }
  //draw overlay
  drawOverlay();




  /***********************************************
  *remove objects from the game if they need to be
   */
   /*
  for (int i = thingsToMove.size() - 1; i >= 0; i--) {
    String state = thingsToMove.get(i).getState();
      if (state.equals("DEAD") || state.equals("REMOVE")) {
      thingsToMove.remove(i);
    }
  }
  */
  /*
  for (int i = thingsToDisplay.size() - 1; i >= 0; i--) {
    String state = thingsToDisplay.get(i).getState();
      if ( state.equals("REMOVE")) {
      thingsToDisplay.remove(i);
    }
  }
  */
  /*
  for (int i = thingsThatExist.size() - 1; i >= 0; i--) {
    String state = thingsThatExist.get(i).getState();
      if ( state.equals("REMOVE")) {
      thingsThatExist.remove(i);
    }
  }
  */
}

public void handleUserInput() {
  if (keyUsed) {
    if (lastKey.equals("W")) {
    }
    if (lastKey.equals("A")) {
    }
    if (lastKey.equals("S")) {
    }
    if (lastKey.equals("D")) {
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