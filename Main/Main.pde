String lastKey = "";
BufferedReader reader;
String line;
int [][] grid;
Tile [][] TileMap;
int blockType;
Sprite s;
int per;
ArrayList<PImage> images;
AI newBots;
boolean keyUsed = false;
String state;
boolean inGame = false;
public void setup(){
  newBots = new AI();
  images = new ArrayList <PImage>();
  for (int i = 1; i <= 9; i++){
      String imageName = i + ".jpg";
      images.add(loadImage(imageName));
      images.get(i-1).resize(50,50);
  }
  for (int i = 1; i < 25; i++){
      String imageName = "Red " + "(" + i + ").gif";
      images.add(loadImage(imageName));
  }
  state = "convertMap";
  size(800, 600);
  s = new Sprite(100,100,"Red");
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
  reader = createReader("level.txt");
}
 void draw(){
  handleUserInput();
  newBots.makeMove();
  try{
    line = reader.readLine();
    
  }
  catch(IOException e){
    e.printStackTrace();
    line = null;
  }
  if(line == null){
    noLoop();
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
  
}
void displayMap(){
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
      if(x > width/per - 4){
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
    if (lastKey.equals("W") && s.curMove.equals("") || s.curMove.equals("walkUp")) {
       s.dir = 'u';
       s.walkMove(0, 4, "walkUp");
    } else if (lastKey.equals("A") && s.curMove.equals("") || s.curMove.equals("walkLeft")) {
       s.dir = 'l';
       s.walkMove(10, 14, "walkLeft");
    } else if (lastKey.equals("S") && s.curMove.equals("") || s.curMove.equals("walkDown")) {
       s.dir = 'd';
       s.walkMove(5, 9, "walkDown");
    } else if (lastKey.equals("D") && s.curMove.equals("") || s.curMove.equals("walkRight")) {
       s.dir = 'r';
       s.walkMove(15, 19, "walkRight");
    } else if(lastKey.equals("SPACE")){
      
    } 
    //only allow one thing per key press
    keyUsed = false;
  } else {
    //s.reset(0);
  }
}