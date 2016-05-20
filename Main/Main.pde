String lastKey = "";
int per;
TileMap grid;
PImage map; 
PImage menu;
PImage arrow;
PImage gameOver;
PImage victory;
PImage players;
PImage tiles;
boolean keyUsed = false;
String state;
boolean inGame = false;
ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();
ArrayList<Players> PlayersOnMap = new ArrayList<Players>();
public void setup(){
  size(800,600);
  background(255,255,255);
  state = "menu";
  map = loadImage("defaultmap.png");
  menu = loadImage("StartMenu.png");
  tiles = loadImage("1.gif");
  makeMap();
 // arrow = loadImage("locator.png");
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
    convertMap();
  }
  if(inGame){
    displayMap();
  }
}

void displayMap(){
  convertMap();
  
}
void setupMenu(){
  image(menu,0,0);
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
void makeMap(){
  try {
    BufferedReader reader = createReader("level.txt");
    String line = reader.readLine();

    while (line != null) {
      line = reader.readLine();
    }
  }catch(IOException e){
    
  }
  per = 100;
  grid = new TileMap(height/per,width/per);
}

void convertMap(){
  background(0);
  textSize(24);
  for (int r = 0; r < height; r+=per) {
    line(0, r, width, r);
  }
  for (int c = 0; c < width; c+=per) {
    line(c, 0, c, height);
  }

  for (int r = 0; r < height/per; r+=1) {
    for (int c = 0; c < width/per; c+=1) {
      fill(255);
      stroke(255);
      
    }
  }
}

void mouseClicked() {
  inc(mouseX, mouseY);
}

void inc(int x, int y) {
  x = x / per;
  y = y / per;
}

void exit() {
  print("Write a file");
  PrintWriter output = createWriter("level.txt");
  output.println(height/per+","+width/per);
  for (int r = 0; r < height/per; r+=1) {
    for (int c = 0; c < width/per; c+=1) {
      output.print(grid.getTile(r,c) + " ");
    }
  }
  output.close();
}