boolean[] downKeys = new boolean[260];
boolean[] downKeys2 = new boolean[260];
PFont font;
PlayerOne p1;
String fighter1 = "red";
String fighter2 = "blue";
char[] controls = new char[] {'w', 'a', 's', 'd', 
  'g', 'h', 'e', 'q', 
  'r', 'f', 'x', 'c'}; // player 1
char[] controls2 = new char[] {',', '.', '/', 'm', 
  'j', 'k', 'l', 'n'};  // player 2 -- does not include the arrow keys
int [][] grid;
ArrayList<Bomb> BombMap;
ArrayList<Sprite> Sprites;
Timer t;
Sprite s, s2, s3, s4;
int per;
ArrayList<PImage> images;
AI newBots;
boolean inGame = false;
int blockType;

public void setup() {
  newBots = new AI();
  images = new ArrayList <PImage>();
  for (int i = 1; i < 7; i++) {
    String imageName = i + ".jpg";
    images.add(loadImage(imageName));
    images.get(i-1).resize(50, 50);
  }
  for (int i = 1; i < 5; i++) {
    String imageName = "Wall " + "(" + i + ")" + ".gif";
    images.add(loadImage(imageName));
    images.get(i+5).resize(50, 50);
  }
  for (int i = 1; i < 3; i++) {
    String imageName = "Bomb" + i + ".jpg";
    images.add(loadImage(imageName));
    images.get(i+9).resize(50, 50);
  }
  for (int i = 1; i < 9; i++) {
    String imageName = "C" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+11).resize(50, 50);
  }
  for (int i = 1; i < 11; i++) {
    String imageName = "PowerUps " + "(" + i + ")" + ".png";
    images.add(loadImage(imageName));
    images.get(i+19).resize(50, 50);
  }
  for (int i = 1; i < 9; i++) {
    String imageName = "N" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+29).resize(50, 50);
  }
  for (int i = 1; i < 9; i++) {
    String imageName = "S" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+37).resize(50, 50);
  }
  for (int i = 1; i < 9; i++) {
    String imageName = "E" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+45).resize(50, 50);
  }
  for (int i = 1; i < 9; i++) {
    String imageName = "W" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+53).resize(50, 50);
  }
  t = new Timer(60);
  size(800, 600);
  s2 = newBots.bot.get(0);
  s3 = newBots.bot.get(1);
  s4 = newBots.bot.get(2);
  per = 50;
  int rows = height/per;
  int cols = width/per - 2;
  grid = new int[rows][cols];
  BombMap = new ArrayList <Bomb>();
  Sprites = new ArrayList <Sprite>();
  initialize(fighter1, downKeys);
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

public void draw() {
  background(255);
  displayMap();
  p1.action();
  t.run();
  displayExplosion();
  newBots.makeMove();
//print(s.x + " " + s.y);
}

void displayMap() {  
  for (int r = 0; r < height/per; r+=1) {
    for (int c = 0; c < width/per - 2; c+=1) {
      if (grid[r][c] == 1) {
        image(images.get(6), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 2) {
        image(images.get(1), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 3) {
        image(images.get(2), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 4) {
        image(images.get(3), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 5) {
        image(images.get(4), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 6) {
        image(images.get(5), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 7) {
        //image(images.get(10), c * per, (r+1) * per - per);
      }
      if (grid[r][c] == 8) {
        image(images.get(20), c * per, (r+1) * per - per);
      }
    }
  }
  rect(width - 2 * per, 0, 2 * per, height);
  for (int r = 0; r < height/per; r+=2) {
    for (int c = width/per - 2; c < width/per; c+=1) {
      line(width - 2 * per, r * per, width * per, r * per);
    }
  }
  image(images.get(6), width - 2 * per, 0, 100, 100);
  image(images.get(1), width - 2 * per, 2 * per, 100, 100);
  image(images.get(2), width - 2 * per, 4 * per, 100, 100);
  image(images.get(3), width - 2 * per, 6 * per, 100, 100);
  image(images.get(4), width - 2 * per, 8 * per, 100, 100);
  image(images.get(5), width - 2 * per, 10 * per, 100, 100);
}

void initialize(String fighter1, boolean[] downKeys) {
  // initialize arena
  //font = loadFont("ShowcardGothic-Reg-48.vlw");
  t = new Timer(62); // actually starts at 60 seconds because timer is slightly off
  s = new Sprite(100, 100, fighter1);
  Sprites.add(s);
  p1 = new PlayerOne(Sprites.get(0), downKeys);
  s2 = newBots.bot.get(0);
  s3 = newBots.bot.get(1);
  s4 = newBots.bot.get(2);
}


void mouseClicked() {
  print(mouseX + " " + mouseY);
  if (mouseX < width - (2 * per) && grid[mouseY/per][mouseX/per] == 7) {
    grid[mouseY/per][mouseX/per] = 0;
  }
  if (mouseX < width - (2 * per) && (grid[mouseY/per][mouseX/per] == 5 || grid[mouseY/per][mouseX/per] == 0)) {
    change(mouseX, mouseY);
  } else {
    if (mouseX < width - (2 * per)) {
      grid[mouseY/per][mouseX/per] = 0;
    } else {
      change(mouseX, mouseY);
    }
  }
}

void change(int x, int y) {
  x = x / per;
  y = y / per;
  if (x > width/per - 3) {
    if (y <= 1) {
      blockType = 1;
    } else if (y <= 3) {
      blockType = 2;
    } else if (y <= 5) {
      blockType = 3;
    } else if (y <= 7) {
      blockType = 4;
    } else if (y <= 9) {
      blockType = 5;
    } else {
      blockType = 6;
    }
  }
  if (x < width/per - 2 && x!= s.x) {
    if (blockType == 1) {
      grid[y][x] = 1;
    } else if (blockType == 2) {
      grid[y][x] = 2;
    } else if (blockType == 3) {
      grid[y][x] = 3;
    } else if (blockType == 4) {
      grid[y][x] = 4;
    } else if (blockType == 5) {
      grid[y][x] = 5;
    } else {
      grid[y][x] = 6;
    }
  }
}


void exit() {
  print("Write a file");
  PrintWriter output = createWriter("level.txt");
  for (int r = 0; r < height/per; r+=1) {
    for (int c = 0; c < width/per - 2; c+=1) {
      output.print(Integer.toString(grid[r][c])+" ");
    }
  }
  output.close();
}

void displayExplosion() {
  for (Bomb x : BombMap) {
    x.explosion();
  }
  for (int i = 0; i < BombMap.size(); i++) {
    if (BombMap.get(i).curFrame == 19) {
      grid[BombMap.get(i).y/per][BombMap.get(i).x/per] = 5;
      BombMap.remove(i);
      i--;
    }
  }
}

void keyPressed() {
  if (key < 256) {
    downKeys[key] = true;
    downKeys2[key] = true;
  }
  if (keyCode == RIGHT) {
    downKeys2[256] = true;
  }
  if (keyCode == LEFT) {
    downKeys2[257] = true;
  }
  if (keyCode == DOWN) {
    downKeys2[258] = true;
  }
  if (keyCode == UP) {
    downKeys2[259] = true;
  }
  if (keyCode == SHIFT) {
    downKeys2[260] = true;
  }
  interrupt(downKeys, 1);
  interrupt(downKeys2, 2);
}

void keyReleased() {
  if (key < 256) {
    downKeys[key] = false;
    downKeys2[key] = false;
  }
  if (keyCode == RIGHT) {
    downKeys2[256] = false;
  }
  if (keyCode == LEFT) {
    downKeys2[257] = false;
  }
  if (keyCode == DOWN) {
    downKeys2[258] = false;
  }
  if (keyCode == UP) {
    downKeys2[259] = false;
  }
  if (keyCode == SHIFT) {
    downKeys2[260] = false;
  }
}

// interrupts a command if another key has been pressed
// i.e. interrups while walking
void interrupt(boolean[] commands, int playerNum) {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      setCommands(256, commands, playerNum);
    } else if (keyCode == LEFT) {
      setCommands(257, commands, playerNum);
    }
  } else if (key < 256) {
    if (key != 's' || key != 'w') {
      setCommands(key, commands, playerNum);
    }
  }
}

// makes sure no attack commands are being run simultaneously
void setCommands(int index, boolean[] commands, int playerNum) {
  for (int i = 0; i < commands.length; i++) {
    if (playerNum == 1) {
      if (validKey(index, controls) && i != index) {
        if (i == 's' && commands['s'] && !commands['w']) {
          commands[i] = true;
        } else if (i == 'w' && commands['w'] && !commands['s']) {
          commands[i] = true;
        } else {
          commands[i] = false;
        }
      }
    } else if (playerNum == 2) {
      if (validKey(index, controls2) && i != index) {
        if (i == 258 && commands[258] && !commands[259]) {
          commands[i] = true;
        } else if (i == 259 && commands[259] && !commands[258]) {
          commands[i] = true;
        } else {
          commands[i] = false;
        }
      }
    }
  }
}

// checks if a key that has been pressed is a valid key for the player
// i.e. if the arrow keys are pressed, then it should only affect player 2
boolean validKey(int index, char[] characters) {
  for (int i = 0; i < characters.length; i++) {
    if (index == characters[i]) {
      return true;
    }
  }
  return false;
}

// resets keys when a new fight has begun
void resetKeys() {
  for (int i = 0; i < downKeys.length; i++) {
    downKeys[i] = false;
  }
  for (int i = 0; i < downKeys2.length; i++) {
    downKeys2[i] = false;
  }
}