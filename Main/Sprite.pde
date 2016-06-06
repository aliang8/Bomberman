class Sprite {
  int x, y;
  String state, name;
  float STEP = 3;
  String curMove;
  ArrayList < PImage > images;
  ArrayList <int[]> Boosts;
  int curFrame = 0;
  char dir;
  int LEFT_BOUND = 30;
  int RIGHT_BOUND = width - 150;
  int UP_BOUND = 0;
  int DOWN_BOUND = height - 50;
  int t;
  int numBombs;
  int range = 1;
  int time;
  boolean canPushBomb;

  //SPRITE CONSTRUCTORS
  //LOAD IMAGES FOR SPRITES 
  public Sprite(int x, int y, String name) {
    images = new ArrayList<PImage>();
    for (int i = 1; i < 26; i++) {
      String imageName = "Red " + "(" + i + ").gif";
      images.add(loadImage(imageName));
      images.get(i-1).resize(25, 45);
    }
    for (int i = 1; i < 26; i++) {
      String imageName = "Blue" + "(" + i + ").gif";
      images.add(loadImage(imageName));
      images.get(i+25-1).resize(25, 50);
    }
    for (int i = 1; i < 26; i++) {
      String imageName = "Yellow" + "(" + i + ").gif";
      images.add(loadImage(imageName));
      images.get(i+49-1).resize(25, 50);
    }
    for (int i = 1; i < 26; i++) {
      String imageName = "Green" + "(" + i + ").gif";
      images.add(loadImage(imageName));
      images.get(i+73-1).resize(25, 50);
    }
    Boosts = new ArrayList<int[]>(); 
    this.x = x;
    this.y = y;
    this.name = name;
    curMove = "";
    curFrame = 0;
    state = "";
    numBombs = 10;
    canPushBomb = false;
  }

  //RESET MOVE
  void reset(int resetFrame) {
    curFrame = resetFrame;
    pushMatrix();
    image(images.get(curFrame), x, y);
    popMatrix();
  }

  //WALKING ANIMATION
  void walkMove(int startFrame, int endFrame, String moveName) {
    state = "walk";
    if (!curMove.equals(moveName)) {
      curMove = moveName;
      curFrame = startFrame;
    }
    if (dir == 'l') {
      if (x - STEP >= LEFT_BOUND) {
        x -= STEP;
      }
      pushMatrix();
      image(images.get(curFrame), x, y);
      popMatrix();
    } else if (dir == 'r') {
      if (x + STEP <= RIGHT_BOUND) {
        x += STEP;
      }
      image(images.get(curFrame), x, y);
    } else if (dir == 'u') {
      if (y - STEP >= UP_BOUND) {
        y -= STEP;
      }
      image(images.get(curFrame), x, y);
    } else {
      if (y + STEP <= DOWN_BOUND) {
        y += STEP;
      }
      image(images.get(curFrame), x, y);
    }
    curFrame++;
    if (curFrame > endFrame) {
      curMove = "";
      curFrame = 0;
      state = "";
    }
  }

  //DIE ANIMATION
  void die() {
    state = "dying";
    curFrame = min((millis()-t-100)/200+21, 24);
    image(images.get(curFrame), x, y);
  }

  //GET THE TYPE OF POWERUP ON GRID
  void obtainPU(int x, int y) {
    int powerUp = grid[y/per][x/per];
    /*for (int[] boost : Boosts) {
     if (boost[0] == powerUp) {
     if (powerUp == 8){
     s.STEP +=2;
     }
     boost[2] += 1;
     boost[1] += 5000;
     return;
     }
     }  
     */
    switch (powerUp) {
    case 8:
      print("Picked up boots");
      Boosts.add(new int[]{8, millis()}); 
      if (s.STEP <= 6) {
        s.STEP += 1;
      }
      break;
    case 9:
      print("Picked up some slime");
      Boosts.add(new int[]{9, millis()}); 
      if (s.STEP >= 1) {
        s.STEP -= 1;
      }
      break;
    case 10:
      print("More bombs");
      Boosts.add(new int[]{10, millis()}); 
      if (s.numBombs <= 5) {
        s.numBombs += 1;
      }
      break;
    case 11:
      print("Lower firerange");
      Boosts.add(new int[]{11, millis()}); 
      if (s.range > 1){
        s.range -= 1;
      }
      break;
    case 12:
      print("Increase fire range");
      Boosts.add(new int[]{12, millis()}); 
      if (s.range <= 6){
        s.range += 1;
      }
      break;
    case 13:
      print("Place more bombs");
      Boosts.add(new int[]{13, millis()}); 
      if (maxBombsOnBoard <= 5){
        maxBombsOnBoard += 1;
      }
      break;
    case 14:
      print("Get poisoned");
      //Boosts.add(14);
      break;
    case 15:
      print("IDEK yet");
      //Boosts.add(15);
      break;
    case 16:
      print("Chuck bombs");
      //Boosts.add(16);
      break;
    case 17:
      print("Push bombs");
      Boosts.add(new int[]{17, millis()});
      canPushBomb = true;
      break;
    }
  }

  //GETTING RID OF THE EFFECTS OF POWERUP/ STACKS
  void losePowerUp() {
    for (int i = 0; i < Boosts.size(); i++) {
      if (millis() - Boosts.get(i)[1] >= 10000) { 
        if (Boosts.get(i)[0] == 8 && s.STEP >= 3) {
          s.STEP--; //* Boosts.get(i)[2];
        }
        if (Boosts.get(i)[0] == 9 && s.STEP <= 3) {
          s.STEP++; //* Boosts.get(i)[2];
        }
        if (Boosts.get(i)[0] == 10 && s.numBombs >= 3) {
          s.numBombs--;
        }
        if (Boosts.get(i)[0] == 12 && s.range > 1) {
          s.range--;
        }
        if (Boosts.get(i)[0] == 13 && maxBombsOnBoard >= 1) {
          maxBombsOnBoard--;
        }
        if (Boosts.get(i)[0] == 17 && canPushBomb == true) {
          canPushBomb = false;
        }
        Boosts.remove(Boosts.get(i));
        i--;
      }
    }
  }
}