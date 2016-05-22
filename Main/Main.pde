String lastKey = "";
int [][] grid;
Tile [][] TileMap;
int per;
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
ArrayList<Integer>mapTiles = new ArrayList<Integer>();
ArrayList<Moveable> thingsToMove = new ArrayList<Moveable>();
ArrayList<Displayable> thingsToDisplay = new ArrayList<Displayable>();
ArrayList<Positionable> thingsThatExist = new ArrayList<Positionable>();
ArrayList<Players> PlayersOnMap = new ArrayList<Players>();
public void setup(){
  state = "convertMap";
  size(800, 600);
  per = 50;
  int rows = height/per;
  int cols = width/per;
  grid = new int[height/per][width/per];
  TileMap = new Tile[height/per][width/per];
  String[] vals = new String[rows*cols];
  try {  
    BufferedReader reader = createReader("level.txt");
    String line = reader.readLine();
    vals = line.split(" ");
    println("Read a file");
    for (int i = 0; i < rows*cols; i++) {
      if (vals[i] != null) {
        int n =Integer.parseInt(vals[i]);
        grid[i/cols][i%cols] = n;
      }
    }
  }
  catch(Exception e) {
    e.printStackTrace();
    println("No file, or other error in setup");
    for (int i = 0; i < vals.length; i++) {
      vals[i]="0";
    }
  }
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
  if(state.equals("convertMap")){
    displayMap();
  }
}
void setState(String newState){
  state = newState;
}
void setupMenu(){
  displayMap();
}
void displayMap(){
        background(0);
        textSize(24);
      
        for (int r = 0; r < height/per; r+=1) {
          for (int c = 0; c < width/per; c+=1) {
            //for each grid element
            
            //3 means green
            if (grid[r][c] == 3) {
              noStroke();
              TileMap[r][c] = new Tile("bomb",false,false);
              TileMap[r][c].showTile("bomb",(int)(c+.5) * per, (int)(r+.5) * per);
              rect(c*per, r*per, per, per);
            }
            //2 means red
            if (grid[r][c] == 2) {
              noStroke();
              fill(255, 0, 0);
              rect(c*per, r*per, per, per);
            }
            //draw text in the middle of the cell
            fill(255);
            text(grid[r][c]+"", c*per+per/2, r*per+per/2);
            
          }
        }
    }
      
    void mouseClicked() {
        inc(mouseX, mouseY);
    }
    
    void inc(int x, int y) {
      x = x / per;
      y = y / per;
      grid[y][x] += 1;
      grid[y][x] %= 10;
    }
    
    void exit() {
      print("Write a file");
      PrintWriter output = createWriter("level.txt");
      for (int r = 0; r < height/per; r+=1) {
        for (int c = 0; c < width/per; c+=1) {
          output.print(grid[r][c]+" ");
        }
      }
      output.close();
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
  if(keyCode == 32){
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