class Tile {
  public String letter;
  public int xInt;
  public int yInt;
  
  public Tile(int startX, int startY, String[][] map){
    xInt = startX;
    yInt = startY;
    rect(xInt*118+90, yInt*118+285, 116, 116, 28);
    letter = map[xInt][yInt];
  }
  
  public void line() {
    text(letter, xInt*188+90+58, yInt*118+285+58);
    println(letter);
  }
}
