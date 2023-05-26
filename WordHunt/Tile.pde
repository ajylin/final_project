class Tile {
  public String letter;
  
  public Tile(int startX, int startY, String[] map){
    rect(startX*118+90, startY*118+285, 116, 116, 28);
    letter = map[startX].substring(startY, startY++);
    text(letter, startX*188+90+58, startY*118+285+58);
    print(letter);
  }
  
  /*
  public String getl(int row, int col, String[] map) {
    
    letter = rowX.substring(col, col++); 
    return letter;
  }
  */
}
