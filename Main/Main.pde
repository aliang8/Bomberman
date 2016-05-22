String lastKey = "";
int [][] grid;
Tile [][] TileMap;
int blockType = 1;
int per;
ArrayList<PImage> images;
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
  images = new ArrayList <PImage>();
        for (int i = 1; i < 10; i++){
            String imageName = i + ".jpg";
            images.add(loadImage(imageName));
        }
  state = "convertMap";
  size(800, 600);
  per = 50;
  int rows = height/per;
  int cols = width/per;
  grid = new int[height/per][width/per - 2];
  TileMap = new Tile[height/per][width/per - 2];
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
          for (int c = 0; c < width/per - 2; c+=1) {
            if (grid[r][c] == 1) {
              TileMap[r][c] = new Tile("steel",false,false);
              TileMap[r][c].showTile("steel",c * per, (r+1) * per - per);
            }
            if (grid[r][c] == 2) {
              TileMap[r][c] = new Tile("metal",false,false);
              TileMap[r][c].showTile("metal",c * per, (r+1) * per - per);
            }
            if (grid[r][c] == 3) {
              TileMap[r][c] = new Tile("wood",false,false);
              TileMap[r][c].showTile("wood",c * per, (r+1) * per - per);
            }
            if (grid[r][c] == 4) {
              TileMap[r][c] = new Tile("floor",false,false);
              TileMap[r][c].showTile("floor",c * per, (r+1) * per - per);
            }
            //draw text in the middle of the cell
            fill(255);
            text(grid[r][c]+"", c*per+per/2, r*per+per/2);
          }
        }
        rect(width - 2 * per, 0, 2 * per, height);
        for (int r = 0; r < height/per; r+=2) {
          for (int c = width/per - 2; c < width/per; c+=1) {
            line(width - 2 * per, r * per, width * per, r * per);
            
          }
        }
        image(images.get(1), width - 2 * per, 0, 100, 100);
        image(images.get(4), width - 2 * per, 2 * per, 100, 100);
        image(images.get(6), width - 2 * per, 4 * per, 100, 100);
        image(images.get(8), width - 2 * per, 6 * per, 100, 100);
        //image(images.get(2), width - 2 * per, 8 * per, 100, 100);
    }
      
    void mouseClicked() {
        change(mouseX, mouseY);
    }
    
    void change(int x, int y) {
      x = x / per;
      y = y / per;
      print(x + " " + y + " " + blockType + " ");
      if(x > width/per - 2){
        if (y <= 1){
          blockType = 1;
        } else if (y <= 3){
          blockType = 2;
        } else if (y <= 5){
          blockType = 3;
        } else {
          blockType = 4;
        }
      }
      if (x < width/per - 2){
        if (blockType == 1){
          grid[y][x] = 1;
        } else if (blockType == 2){
          grid[y][x] = 2;
        } else if (blockType == 3){
          grid[y][x] = 3;
        } else {
          grid[y][x] = 4;
        }       
      }  
    }
    
    void exit() {
      print("Write a file");
      PrintWriter output = createWriter("level.txt");
      for (int r = 0; r < height/per - 2; r+=1) {
        for (int c = 0; c < width/per - 2; c+=1) {
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