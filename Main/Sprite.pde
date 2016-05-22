class Sprite{
    private Bombs inHand;
    private int x,y;
    private String state,name;
    int STEP = 8;
    String curMove;
    ArrayList < PImage > images;
    int curFrame = 0;
    char dir;
    int LEFT_BOUND = 30;
    int RIGHT_BOUND = width -15;
    public Sprite(int x, int y, String name){
      images = new ArrayList<PImage>();
      for (int i = 1; i < 25; i++){
        String imageName = "Red " + "(" + i + ").gif";
        images.add(loadImage(imageName));
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
        } else {
            if (x + STEP <= RIGHT_BOUND) {
              x += STEP;
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
    public float getX(){
        return x;
    }
    public float getY(){
        return y;
    }
    public String getState(){
        return state;
    }
    public int getinHand(){
        return inHand.getAmmo();
    }
    public void setState(String newState){
        state = newState;
    }
}