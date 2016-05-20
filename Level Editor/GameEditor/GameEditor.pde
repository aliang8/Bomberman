int per;
int [][]grid;
void setup() {
  size(800, 640);
  per = 80;
  int rows = height/per;
  int cols = width/per;
  grid = new int[height/per][width/per];
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

void draw() {
  background(0);
  textSize(24);

  for (int r = 0; r < height/per; r+=1) {
    for (int c = 0; c < width/per; c+=1) {
      //for each grid element
      
      //3 means green
      if (grid[r][c] == 3) {
        noStroke();
        fill(0, 255, 0);
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

//increase a box to the next value
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