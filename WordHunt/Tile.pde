class Tile {
  public Tile(int startX, int startY){
    rect(startX*118+90, startY*118+285, 116, 116, 28);
  }
  
  public void letter(int row, int col, String[][] map) {
    textSize(50);
    text(map[row][col], row*188+90+58, col*118+285+58);
  }
}
