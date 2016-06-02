class Sprite {
  Bomb inHand;
  int x, y;
  String state, name;
  float STEP = 3;
  String curMove;
  ArrayList < PImage > images;
  int curFrame = 0;
  char dir;
  int LEFT_BOUND = 30;
  int RIGHT_BOUND = width - 150;
  int UP_BOUND = 0;
  int DOWN_BOUND = height - 50;
  int t;
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
    this.x = x;
    this.y = y;
    this.name = name;
    curMove = "";
    curFrame = 0;
    state = "";
  }
  void reset(int resetFrame) {
    curFrame = resetFrame;
    pushMatrix();
    image(images.get(curFrame), x, y);
    popMatrix();
  }
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
  void die() {
    state = "dying";
    curFrame = min((millis()-t-200)/200+21, 24);
    print("works");
    print(curFrame);
    image(images.get(curFrame), x, y);
  }
  public String getState() {
    return state;
  }
  public void setState(String newState) {
    state = newState;
  }
}