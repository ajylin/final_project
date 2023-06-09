public class Tile {
  public String letter;
  public int xInt;
  public int yInt;
  public boolean glow = false;
  
  public Tile(int startX, int startY, String[][] map){
    xInt = startX*118+90;
    yInt = startY*118+285;
    stroke(51, 105, 3);
    strokeWeight(7);
    fill(241, 222, 189);
    if (glow){ stroke(100, 200, 100);}
    rect(xInt, yInt, 116, 116, 28);
    letter = map[startY][startX];
    fill (0,0,0);
    textSize(100);
    textAlign(CENTER);
    text(letter, xInt+55, yInt+90);
    textAlign(LEFT);
  }
  
  void glow(int startX, int startY) {
    noFill();
    stroke(255, 237, 152);
    strokeWeight(6);
    rect(xInt, yInt, 116, 116, 28);
  }
}
