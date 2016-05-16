public class MakeMap{
int per;
int [][]grid;
public void makeMap(){
  try {
    BufferedReader reader = createReader("level.txt");
    String line = reader.readLine();

    while (line != null) {
      line = reader.readLine();
    }
  }catch(IOException e){
    
  }
  size(1200, 1000);
  per = 100;
  grid = new int[height/per][width/per];
}

void displayMap(){
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
      text(grid[r][c]+"", c*per+per/2, r*per+per/2);
      if (grid[r][c] == 3) {
        noStroke();
        fill(0, 255, 0);
        rect(c*per, r*per, per, per);
      }
      if (grid[r][c] == 2) {
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
  grid[y][x] += 1;
  grid[y][x] %= 10;
}

void exit() {
  print("Write a file");
  PrintWriter output = createWriter("level.txt");
  output.println(height/per+","+width/per);
  for (int r = 0; r < height/per; r+=1) {
    for (int c = 0; c < width/per; c+=1) {
      output.print(grid[r][c]+" ");
    }
  }
  output.close();
}
}