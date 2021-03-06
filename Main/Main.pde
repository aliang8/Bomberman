//*---------------------------VARIABLES------------------------------------*
boolean[] downKeys = new boolean[260];
boolean[] downKeys2 = new boolean[260];
PFont font;
PlayerOne p1;
PlayerTwo p2;
char[] controls = new char[] {'w', 'a', 's', 'd', 
  'g', 'h', 'e', 'q', 
  'r', 'f', 'x', 'c'}; // player 1
char[] controls2 = new char[] {',', '.', '/', 'm', 
  'j', 'k', 'l', 'n'};  // player 2 -- does not include the arrow keys
int [][] grid;
ArrayList<Bomb> BombMap;
ArrayList<PowerUp> PowerUps;
ArrayList<Sprite> Sprites;
ArrayList<Sprite> bot = new ArrayList<Sprite>();
Timer t;
Sprite s, s2, s3, s4;
Sprite t1;
int per;
ArrayList<PImage> images;
PImage menu;
PImage victoryBanner;
PImage background;
PImage tie;
//AI newBots;
String gameState;
int blockType;
String p1Color;


//*--------------------------LOAD IMAGES AND INIT VARIABLES-------------------------*
public void setup() {
  //newBots = new AI();
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
    String imageName = "Bomb" + i + ".gif";
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
  for (int i = 1; i < 9; i++) {
    String imageName = "H" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+61).resize(50, 50);
  }
  for (int i = 1; i < 9; i++) {
    String imageName = "V" + i + ".gif";
    images.add(loadImage(imageName));
    images.get(i+69).resize(50, 50);
  }
  for (int i = 1; i < 5; i++) {
    String imageName = "Victory " + "(" + i + ")" + ".png";
    images.add(loadImage(imageName));
    images.get(i+77).resize(200, 299);
  }
  t = new Timer(120);
  size(800, 600);
  surface.setResizable(true);
  //s2 = newBots.bot.get(0);
  //s3 = newBots.bot.get(1);
  //s4 = newBots.bot.get(2);
  per = 50;
  gameState = "menu";
}

public void draw() {
  background = loadImage("background.png");
  if (t.time == 119) {
    gameState = "gameOver";
  }
  if (gameState.equals("inGame")) {
    background.resize(700, 600);
    background(background);
  } else if (gameState.equals("levelEditor")) {
    background.resize(800, 600);
    background(background);
  }
  if (gameState.equals("menu")) {
    menu = loadImage("Menu.jpg");
    menu.resize(800, 600);
    displayMenu();
  } else if (gameState.equals("selectColorP1") || gameState.equals("selectColorP2") ||gameState.equals("selectColorLE")) {
    background(255);
    displayColorSelect();
  } else if (gameState.equals("levelEditor") || gameState.equals("inGame")) {
    displayMap();
    p1.action();
    p2.action();
    t.run();
    displayExplosion();
    if (s.canPushBomb) {
      s.moveBomb();
    }
    if (t1.canPushBomb) {
      t1.moveBomb2();
    }
    //newBots.makeMove();
  } else if (gameState.equals("gameOver")) {
    background(255);
    victoryBanner = loadImage("VictoryBanner.png");
    victoryBanner.resize(victoryBanner.width * 3, victoryBanner.height * 3);
    tie = loadImage("Tie.png");
    tie.resize(800, 600);
    displayVictoryScreen();
  } else if (gameState.equals("restart")) {
    displayRestartButton();
  }
}

void displayMap() {  
  //ITERATE THROUGH GRID AND DISPLAY TILE BASED ON NUMBER
  if (gameState.equals("levelEditor")) {
    for (int r = 0; r < height/per; r+=1) {
      for (int c = 0; c < width/per - 2; c+=1) {
        //WALLS
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
        //BOMB
        if (grid[r][c] == 7) {
          //        BombMap.add(new Bomb("bomb", false, c * per, (r+1) * per - per));
        }
        //POWERUPS
        if (grid[r][c] == 8) {
          image(images.get(20), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 9) {
          image(images.get(21), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 10) {
          image(images.get(22), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 11) {
          image(images.get(23), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 12) {
          image(images.get(24), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 13) {
          image(images.get(25), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 14) {
          image(images.get(26), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 15) {
          image(images.get(27), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 16) {
          image(images.get(28), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 17) {
          image(images.get(29), c * per, (r+1) * per - per);
        }
      }
    }

    //SIDE SELECTION BAR
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
  //IN GAME DISPLAY
  if (gameState.equals("inGame")) {
    for (int r = 0; r < height/per; r+=1) {
      for (int c = 0; c < width/per; c+=1) {
        //WALLS
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
        //BOMB
        if (grid[r][c] == 7) {
        }
        //POWERUPS
        if (grid[r][c] == 8) {
          image(images.get(20), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 9) {
          image(images.get(21), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 10) {
          image(images.get(22), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 11) {
          image(images.get(23), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 12) {
          image(images.get(24), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 13) {
          image(images.get(25), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 14) {
          image(images.get(26), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 15) {
          image(images.get(27), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 16) {
          image(images.get(28), c * per, (r+1) * per - per);
        }
        if (grid[r][c] == 17) {
          image(images.get(29), c * per, (r+1) * per - per);
        }
      }
    }
  }
}

void initialize(String name, String name2, boolean[] downKeys, boolean[] downKeys2) {
  surface.setSize(700, 600);
  int rows = height/per;
  int cols = width/per;
  grid = new int[rows][cols];
  BombMap = new ArrayList <Bomb>();
  PowerUps = new ArrayList <PowerUp>();
  Sprites = new ArrayList <Sprite>();
  s = new Sprite(52, 52, name);
  t1 = new Sprite(600, 52, name2);
  Sprites.add(s);
  Sprites.add(t1);
  s.dir = 'r';
  t1.dir = 'l';
  s.RIGHT_BOUND = width;
  t1.RIGHT_BOUND = width;
  p1 = new PlayerOne(s, downKeys);
  p2 = new PlayerTwo(t1, downKeys2);
  //s2 = newBots.bot.get(0);
  //s3 = newBots.bot.get(1);
  //s4 = newBots.bot.get(2);
  String[] vals = new String[rows*cols];
  try {  
    BufferedReader reader = createReader("inGame.txt");
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

void initializeLE(String name, boolean[] downKeys) {
  int rows = height/per;
  int cols = width/per - 2;
  grid = new int[rows][cols];
  BombMap = new ArrayList <Bomb>();
  PowerUps = new ArrayList <PowerUp>();
  Sprites = new ArrayList <Sprite>();
  s = new Sprite(52, 52, name);
  Sprites.add(s);
  s.dir = 'r';
  s.RIGHT_BOUND = width;
  p1 = new PlayerOne(Sprites.get(0), downKeys);
  //s2 = bot.get(0);
  //s3 = bot.get(1);
  //s4 = bot.get(2);
  String[] vals = new String[rows*cols];
  try {  
    BufferedReader reader = createReader("inGame.txt");
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

void mouseClicked() {
  print(mouseX + " " + mouseY);
  //GO TO SELECT COLOR SCREEN
  if (gameState.equals("menu")) {
    if (mouseX > 237 && mouseX < 562 && mouseY > 393 && mouseY < 427) {
      gameState = "selectColorP1";
    }
    if (mouseX > 237 && mouseX < 562 && mouseY > 437 && mouseY < 469) {
      gameState = "selectColorLE";
    }
  } //LOAD GAME
  else if (gameState.equals("selectColorP1")) {
    if (mouseX > 40 && mouseX < 380 && mouseY > 40 && mouseY < 280) {
      gameState = "selectColorP2";
      p1Color = "red";
    } else if (mouseX > 420 && mouseX < 760 && mouseY > 40 && mouseY < 280) {
      gameState = "selectColorP2";
      p1Color = "blue";
    } else if (mouseX > 40 && mouseX < 380 && mouseY > 320 && mouseY < 560) {
      gameState = "selectColorP2";
      p1Color = "green";
    } else if (mouseX > 420 && mouseX < 760 && mouseY > 320 && mouseY < 560) {
      gameState = "selectColorP2";
      p1Color = "yellow";
    }
  } else if (gameState.equals("selectColorP2")) {
    if (mouseX > 40 && mouseX < 380 && mouseY > 40 && mouseY < 280) {
      gameState = "inGame";
      initialize(p1Color, "red", downKeys, downKeys2);
    } else if (mouseX > 420 && mouseX < 760 && mouseY > 40 && mouseY < 280) {
      gameState = "inGame";
      initialize(p1Color, "blue", downKeys, downKeys2);
    } else if (mouseX > 40 && mouseX < 380 && mouseY > 320 && mouseY < 560) {
      gameState = "inGame";
      initialize(p1Color, "green", downKeys, downKeys2);
    } else if (mouseX > 420 && mouseX < 760 && mouseY > 320 && mouseY < 560) {
      gameState = "inGame";
      initialize(p1Color, "yellow", downKeys, downKeys2);
    }
  } //LOAD FOR LEVEL EDITOR
  else if (gameState.equals("selectColorLE")) {
    if (mouseX > 40 && mouseX < 380 && mouseY > 40 && mouseY < 280) {
      gameState = "levelEditor";
      initializeLE("red", downKeys);
    } else if (mouseX > 420 && mouseX < 760 && mouseY > 40 && mouseY < 280) {
      gameState = "levelEditor";
      initializeLE("blue", downKeys);
    } else if (mouseX > 40 && mouseX < 380 && mouseY > 320 && mouseY < 560) {
      gameState = "levelEditor";
      initializeLE("green", downKeys);
    } else if (mouseX > 420 && mouseX < 760 && mouseY > 320 && mouseY < 560) {
      gameState = "levelEditor";
      initializeLE("yellow", downKeys);
    }
  } else if (gameState.equals("levelEditor")) {
    //MAP GENERATOR/ LEVEL EDITOR
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
  } else if (gameState.equals("gameOver")) {
    gameState = "restart";
  } else if (gameState.equals("restart")) {
    //RESTART BUTTON
    if (mouseX > 150 && mouseX < 650 && mouseY > 125 && mouseY < 475) {
      gameState = "selectColor";
    }
  }
}

//CHANGE BLOCKTYPE AFTER CLICK
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
  if (gameState.equals("inGame")) {
    PrintWriter output = createWriter("level.txt");
    for (int r = 0; r < height/per; r+=1) {
      for (int c = 0; c < width/per; c+=1) {
        if (grid[r][c] == 7) {
          output.print(Integer.toString(5) + " ");
        } else {
          output.print(Integer.toString(grid[r][c])+" ");
        }
      }
    }
    output.close();
  } 
  if (gameState.equals("levelEditor")) {
    PrintWriter output = createWriter("inGame.txt");
    for (int r = 0; r < height/per; r+=1) {
      for (int c = 0; c < width/per - 2; c+=1) {
        if (grid[r][c] == 7) {
          output.print(Integer.toString(5) + " ");
        } else {
          output.print(Integer.toString(grid[r][c])+" ");
        }
      }
    }
    output.close();
  }
}

//SHOW EXPLOSIONS AND REMOVES BOMB AFTERWARDS
void displayExplosion() {
  for (Bomb x : BombMap) {
    if (x.owner.equals("PlayerTwo")) {
      x.explosion2();
    } else if (x.owner.equals("PlayerOne")) {
      x.explosion();
    }
  }
  for (int i = 0; i < BombMap.size(); i++) {
    if (BombMap.get(i).curFrame == 19) {
      grid[BombMap.get(i).y/per][BombMap.get(i).x/per] = 5;
      BombMap.remove(i);
      i--;
    }
  }
}

//GENERATES A RANDOM POWERUP BASED ON GRID##
void dropPowerUp(int x, int y) {
  int index = (int)((Math.random() * 10) + 20);
  if (index == 20) {
    PowerUps.add(new PowerUp("boots", x/per, y/per));
    grid[y/per][x/per] = 8;
  } else if (index == 21) {
    PowerUps.add(new PowerUp("slow", x/per, y/per));
    grid[y/per][x/per] = 9;
  } else if (index == 22) {
    PowerUps.add(new PowerUp("linebomb", x/per, y/per));
    grid[y/per][x/per] = 10;
  } else if (index == 23) {
    PowerUps.add(new PowerUp("firedown", x/per, y/per));
    grid[y/per][x/per] = 11;
  } else if (index == 24) {
    PowerUps.add(new PowerUp("fireup", x/per, y/per));
    grid[y/per][x/per] = 12;
  } else if (index == 25) {
    PowerUps.add(new PowerUp("boots", x/per, y/per));
    grid[y/per][x/per] = 13;
  } else if (index == 26) {
    PowerUps.add(new PowerUp("skull", x/per, y/per));
    grid[y/per][x/per] = 14;
  } else if (index == 27) {
    PowerUps.add(new PowerUp("boots", x/per, y/per));
    grid[y/per][x/per] = 15;
  } else if (index == 28) {
    PowerUps.add(new PowerUp("powerglove", x/per, y/per));
    grid[y/per][x/per] = 16;
  } else {
    PowerUps.add(new PowerUp("boxingglove", x/per, y/per));
    grid[y/per][x/per] = 17;
  }
}

//MENU IMAGE
void displayMenu() {
  image(menu, 0, 0);
}

//SELECT THE COLOR OF SPRITE
void displayColorSelect() {
  if (gameState.equals("selectColorP1")) {
    textSize(15);
    text("PlayerOne", 10, 10, 300, 200);
  } else if (gameState.equals("selectColorP2")) {
    textSize(15);
    text("PlayerTwo", 10, 10, 300, 200);
  }
  rectMode(CORNER);
  fill(#FF3333);
  rect(40, 40, 340, 240);
  fill(#000000);
  textSize(120);
  text("RED", 80, 80, 300, 200);
  fill(#3399FF);
  rect(420, 40, 340, 240);
  fill(#000000);
  textSize(110);
  text("BLUE", 450, 80, 300, 200);
  fill(#00CC66);
  rect(40, 320, 340, 240);
  fill(#000000);
  textSize(80);
  text("GREEN", 65, 390, 300, 200);
  fill(#FFFF33);
  rect(420, 320, 340, 240);
  fill(#000000);
  textSize(75);
  text("YELLOW", 435, 390, 340, 200);
}

//VICTORY SPRITES
void displayVictoryScreen() {
  surface.setSize(800, 600);
  if (s.score == t1.score) {
    image(tie, 0, 0);
  } else {
    image(victoryBanner, 400, 120);
    if (winner().equals("green")) {
      imageMode(CENTER);
      image(images.get(78), 400, 370);
    } else if (winner().equals("yellow")) {
      imageMode(CENTER);
      image(images.get(79), 400, 370);
    } else if (winner().equals("red")) {
      imageMode(CENTER);
      image(images.get(80), 400, 370);
    } else {
      imageMode(CENTER);
      image(images.get(81), 400, 370);
    }
  }
}

//RESTART
void displayRestartButton() {
  background(255);
  rectMode(CENTER);
  stroke(50);
  noFill();
  rect(400, 300, 500, 350);
  textSize(100);
  text(" RESTART ", 140, 330);
}

String winner() {
  String winner = "";
  //IF WE HAVE BOTS
  /*
  for (int i = 0; i < bot.size() + 1; i++) {
   if (bot.get(i).score > bot.get(i + 1).score && bot.get(i).score > s.score) {
   winner = bot.get(i).name;
   } else if (bot.get(i+1).score > bot.get(i).score && bot.get(i+1).score > s.score) {
   winner = bot.get(i+1).name;
   } else {
   winner = s.name;
   }
   }
   */
  if (max(s.score, t1.score) == s.score) {
    winner = s.name;
  } else if (max(s.score, t1.score) == t1.score) {
    winner = t1.name;
  }
  return winner;
}

Bomb closestBomb() {
  for (int i = 0; i < BombMap.size(); i++) {
    if (s.dir == 'u' && (abs(s.y - per - BombMap.get(i).y) < 5 && abs(BombMap.get(i).x - s.x) < 23)) {
      return BombMap.get(i);
    } else if (s.dir == 'd' && (abs(BombMap.get(i).y - per - s.y) < 5 && abs(BombMap.get(i).x - s.x) < 23)) {
      return BombMap.get(i);
    } else if (s.dir == 'l' && (abs(BombMap.get(i).x + per + 1 - s.x)< 5 && abs(BombMap.get(i).y - s.y) < 20)) {
      return BombMap.get(i);
    } else if (s.dir == 'r' && (abs(BombMap.get(i).x - 1 - (s.x + 20)) < 5 && abs(BombMap.get(i).y - s.y) < 20)) {
      return BombMap.get(i);
    }
  }
  return null;
}

Bomb closestBomb2() {
  for (int i = 0; i < BombMap.size(); i++) {
    if (t1.dir == 'u' && (abs(t1.y - per - BombMap.get(i).y) < 5 && abs(BombMap.get(i).x - t1.x) < 23)) {
      return BombMap.get(i);
    } else if (t1.dir == 'd' && (abs(BombMap.get(i).y - per - t1.y) < 5 && abs(BombMap.get(i).x - t1.x) < 23)) {
      return BombMap.get(i);
    } else if (t1.dir == 'l' && (abs(BombMap.get(i).x + per + 1 - t1.x)< 5 && abs(BombMap.get(i).y - t1.y) < 20)) {
      return BombMap.get(i);
    } else if (t1.dir == 'r' && (abs(BombMap.get(i).x - 1 - (t1.x + 20)) < 5 && abs(BombMap.get(i).y - t1.y) < 20)) {
      return BombMap.get(i);
    }
  }
  return null;
}

//IF IT IS A BLOCK
boolean isBlock(int x) {
  return (x == 1 || x == 2 || x == 3 || x == 4 || x == 6);
}

boolean isBreakableBlock(int x) {
  return (x == 1);
}

//IF IT IS A POWERUP
boolean isPowerUp(int x) {
  return (x == 8 || x == 9 || x == 10 || x == 11 || x == 12 || x == 13 || x == 14 || x == 15 || x == 16 || x == 17);
}


//*-------------------------MOVEMENT AND KEY/MAKES MORE SMOOTH----------------------------*
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