class Tile {
  public String letter;
  public int xInt;
  public int yInt;
  
  public Tile(int startX, int startY, String[][] map){
    xInt = startX*118+90;
    yInt = startY*118+285;
    stroke(51, 105, 3);
    strokeWeight(7);
    fill(241, 222, 189);
    rect(xInt, yInt, 116, 116, 28);
    letter = map[startY][startX];
    System.out.println(letter);
    fill (0,0,0);
    textSize(100);
    //textAlign(CENTER);
    text(letter, xInt+20, yInt+90);
  }
  void mousePressed() {
    
  }
  void mouseDragged() {
    
  }
}
