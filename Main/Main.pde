String lastKey = "";
TileMap grid;
int per;
int [][]designermap;
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
  per = 100;
  size(600,800);
  background(255,255,255);
  state = "convertMap";
  map = loadImage("defaultmap.png");
  menu = loadImage("StartMenu.png");
  tiles = loadImage("1.gif");
  grid = new TileMap(8,6);
  designermap = new int[height/per][width/per];
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
  makeMap();
}
void displayMap(){
        try {
            BufferedReader reader = createReader("level.txt");
            String line = reader.readLine();
             int rCounter = 0;
            int cCounter = 0;
            for(int i = 0; i < line.length()-1;i++){
              if(line.substring(i,i+1).equals("2")){
                if(cCounter < grid.getWidth()){
                grid[0][cCounter]=new Tiles("eWall",true,false);
                cCounter++;
                }
                rCounter++;
                cCounter = 0;
                grid[rCounter][cCounter] = new Tiles("breakableWall",true,false);
              }     
            }
            while (line != null) {
                line = reader.readLine();
        }
        }catch(IOException e){
            
        }
        designermap = new int[height/per][width/per]; 
      }
    void makeMap(){
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
                text(designermap[r][c]+"", c*per+per/2, r*per+per/2);
                if (designermap[r][c] == 3) {
                    noStroke();
                    fill(0, 255, 0);
                    rect(c*per, r*per, per, per);
                }
                if (designermap[r][c] == 2) {
                    noStroke();
                    fill(255, 0, 0);
                    rect(c*per, r*per, per, per);
                }
            }
        }
    }
      
    void mouseClicked() {
        inc(mouseX, mouseY);
    }
    
    void inc(int x, int y) {
        x = x / per;
        y = y / per;
        if(designermap[y][x] > 2){
          designermap[y][x]= 0;
          designermap[y][x]%=10;
        }
        designermap[y][x] ++;
        designermap[y][x] %= 10;

    }
    
    void exit() {
        print("Write a file");
        PrintWriter output = createWriter("level.txt");
        output.println(height/per+","+width/per);
        for (int r = 0; r < height/per; r+=1) {
            for (int c = 0; c < width/per; c+=1) {
                output.print(designermap[r][c]+" ");
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