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
  int maxBombsOnBoard = 1;
  int time;
  int score;
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
      images.get(i+25-1).resize(25, 45);
    }
    for (int i = 1; i < 26; i++) {
      String imageName = "Yellow" + "(" + i + ").gif";
      images.add(loadImage(imageName));
      images.get(i+49-1).resize(25, 45);
    }
    for (int i = 1; i < 26; i++) {
      String imageName = "Green" + "(" + i + ").gif";
      images.add(loadImage(imageName));
      images.get(i+73-1).resize(25, 45);
    }
    Boosts = new ArrayList<int[]>(); 
    this.x = x;
    this.y = y;
    this.name = name;
    curMove = "";
    curFrame = 0;
    state = "";
    score = 0;
    numBombs = 15;
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
  void die(String player) {
    state = "dying";
    curFrame = min((millis()-t-100)/200+21, 24);
    if (player.equals("p1") && s.name.equals("red")) {
      image(images.get(curFrame), x, y);
    } else if (player.equals("p1") && s.name.equals("blue")) {
      image(images.get(curFrame + 25), x, y);
    } else if (player.equals("p1") && s.name.equals("yellow")) {
      image(images.get(curFrame + 50), x, y);
    } else if (player.equals("p1") && s.name.equals("green")) {
      image(images.get(curFrame + 75), x, y);
    } else if (player.equals("p2") && t1.name.equals("red")) {
      image(images.get(curFrame), x, y);
    } else if (player.equals("p2") && t1.name.equals("blue")) {
      image(images.get(curFrame + 25), x, y);
    } else if (player.equals("p2") && t1.name.equals("yellow")) {
      image(images.get(curFrame + 50), x, y);
    } else if (player.equals("p2") && t1.name.equals("green")) {
      image(images.get(curFrame + 75), x, y);
    }
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
      println("Picked up boots");
      s.Boosts.add(new int[]{8, millis()}); 
      if (s.STEP <= 6) {
        s.STEP += 1;
      }
      break;
    case 9:
      println("Picked up some slime");
      s.Boosts.add(new int[]{9, millis()}); 
      if (s.STEP >= 1) {
        s.STEP -= 1;
      }
      break;
    case 10:
      println("More bombs");
      s.Boosts.add(new int[]{10, millis()}); 
      if (s.numBombs <= 5) {
        s.numBombs += 1;
      }
      break;
    case 11:
      println("Lower firerange");
      s.Boosts.add(new int[]{11, millis()}); 
      if (s.range > 1) {
        s.range -= 1;
      }
      break;
    case 12:
      println("Increase fire range");
      s.Boosts.add(new int[]{12, millis()}); 
      if (s.range <= 6) {
        s.range += 1;
      }
      break;
    case 13:
      println("Place more bombs");
      s.Boosts.add(new int[]{13, millis()}); 
      break;
    case 14:
      println("Get poisoned");
      //Boosts.add(14);
      break;
    case 15:
      println("IDEK yet");
      //Boosts.add(15);
      break;
    case 16:
      println("Chuck bombs");
      //Boosts.add(16);
      break;
    case 17:
      println("Push bombs");
      s.Boosts.add(new int[]{17, millis()});
      s.canPushBomb = true;
      break;
    }
  }

  //GET THE TYPE OF POWERUP ON GRID PLAYER 2
  void obtainPU2(int x, int y) {
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
      println("Picked up boots");
      t1.Boosts.add(new int[]{8, millis()}); 
      if (t1.STEP <= 6) {
        t1.STEP += 1;
      }
      break;
    case 9:
      println("Picked up some slime");
      t1.Boosts.add(new int[]{9, millis()}); 
      if (t1.STEP >= 1) {
        t1.STEP -= 1;
      }
      break;
    case 10:
      println("More bombs");
      t1.Boosts.add(new int[]{10, millis()}); 
      if (t1.numBombs <= 5) {
        t1.numBombs += 1;
      }
      break;
    case 11:
      println("Lower firerange");
      t1.Boosts.add(new int[]{11, millis()}); 
      if (t1.range > 1) {
        t1.range -= 1;
      }
      break;
    case 12:
      println("Increase fire range");
      t1.Boosts.add(new int[]{12, millis()}); 
      if (t1.range <= 6) {
        t1.range += 1;
      }
      break;
    case 13:
      println("Place more bombs");
      t1.Boosts.add(new int[]{13, millis()}); 
      break;
    case 14:
      println("Get poisoned");
      //Boosts.add(14);
      break;
    case 15:
      println("IDEK yet");
      //Boosts.add(15);
      break;
    case 16:
      println("Chuck bombs");
      //Boosts.add(16);
      break;
    case 17:
      println("Push bombs");
      t1.Boosts.add(new int[]{17, millis()});
      t1.canPushBomb = true;
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
        if (Boosts.get(i)[0] == 13 && s.maxBombsOnBoard >= 1) {
          s.maxBombsOnBoard--;
        }
        if (Boosts.get(i)[0] == 17 && s.canPushBomb == true) {
          s.canPushBomb = false;
        }
        Boosts.remove(Boosts.get(i));
        i--;
      }
    }
  }


  //GETTING RID OF THE EFFECTS OF POWERUP/ STACKS FOR PLAYER 2
  void losePowerUp2() {
    for (int i = 0; i < Boosts.size(); i++) {
      if (millis() - Boosts.get(i)[1] >= 10000) { 
        if (Boosts.get(i)[0] == 8 && t1.STEP >= 3) {
          t1.STEP--; //* Boosts.get(i)[2];
        }
        if (Boosts.get(i)[0] == 9 && t1.STEP <= 3) {
          t1.STEP++; //* Boosts.get(i)[2];
        }
        if (Boosts.get(i)[0] == 10 && t1.numBombs >= 3) {
          t1.numBombs--;
        }
        if (Boosts.get(i)[0] == 12 && t1.range > 1) {
          t1.range--;
        }
        if (Boosts.get(i)[0] == 13 && t1.maxBombsOnBoard >= 1) {
          t1.maxBombsOnBoard--;
        }
        if (Boosts.get(i)[0] == 17 && t1.canPushBomb == true) {
          t1.canPushBomb = false;
        }
        Boosts.remove(Boosts.get(i));
        i--;
      }
    }
  }

  //ALLOW PLAYER TO PUSH THE BOMBS
  void moveBomb() {
    for (Bomb b : BombMap) {
      if (b.owner.equals("PlayerOne")) {
        if (s.dir == 'l' && grid[s.y/per][(s.x - 3)/per] == 7) {
          if (!isBlock(grid[b.y/per][(b.x - 1)/per])) {
            b.x -= s.STEP; 
            if (b.x/per == (s.x - 3)/per - 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per][b.x/per + 1] = 5;
            }
          }
        } else if (s.dir == 'r' && grid[s.y/per][(s.x + 22)/per] == 7) {
          if (!isBlock(grid[b.y/per][(b.x + 51)/per])) {
            b.x += s.STEP;
            if (b.x/per == (s.x - 3)/per + 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per][b.x/per - 1] = 5;
            }
          }
        } else if (s.dir == 'u' && grid[(s.y - 3)/per][s.x/per] == 7) {
          if (!isBlock(grid[(b.y - 3)/per][b.x/per])) {
            b.y += s.STEP;
            if (b.y/per == (s.y - 3)/per - 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per + 1][b.x/per] = 5;
            }
          }
        } else if (s.dir == 'd' && grid[(s.y + 47)/per][s.x/per] == 7) {
          if (!isBlock(grid[(b.y + 51)/per][b.x/per])) {
            b.y -= s.STEP;
            if (b.y/per == (s.y - 3)/per + 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per - 1][b.x/per] = 5;
            }
          }
        }
      }
    }
  }

  //ALLOW PLAYER 2 TO PUSH THE BOMBS
  void moveBomb2() {
    for (Bomb b : BombMap) {
      if (b.owner.equals("PlayerTwo")) {
        if (t1.dir == 'l' && grid[t1.y/per][(t1.x - 3)/per] == 7) {
          if (!isBlock(grid[b.y/per][(b.x - 1)/per])) {
            b.x -= t1.STEP; 
            if (b.x/per == (t1.x - 3)/per - 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per][b.x/per + 1] = 5;
            }
          }
        } else if (t1.dir == 'r' && grid[t1.y/per][(t1.x + 22)/per] == 7) {
          if (!isBlock(grid[b.y/per][(b.x + 51)/per])) {
            b.x += t1.STEP;
            if (b.x/per == (t1.x - 3)/per + 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per][b.x/per - 1] = 5;
            }
          }
        } else if (t1.dir == 'u' && grid[(t1.y - 3)/per][t1.x/per] == 7) {
          if (!isBlock(grid[(b.y - 3)/per][b.x/per])) {
            b.y += t1.STEP;
            if (b.y/per == (t1.y - 3)/per - 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per + 1][b.x/per] = 5;
            }
          }
        } else if (t1.dir == 'd' && grid[(t1.y + 47)/per][t1.x/per] == 7) {
          if (!isBlock(grid[(b.y + 51)/per][b.x/per])) {
            b.y -= t1.STEP;
            if (b.y/per == (t1.y - 3)/per + 1) {
              grid[b.y/per][b.x/per] = 7;
              grid[b.y/per - 1][b.x/per] = 5;
            }
          }
        }
      }
    }
  }
}