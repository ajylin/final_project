class Tile {
  public String letter;
  public int xInt;
  public int yInt;
<<<<<<< HEAD
  public String[] letters;
  
  public Tile(int startX, int startY, String[] map){
    xInt = startX;
    yInt = startY;
    letters = map;
    letter = map;
    rect(xInt*118+90, yInt*118+285, 116, 116, 28);
  }
  
  public void line(){
    print(letter);
    text(letter, xInt*188+90+58, yInt*118+285+58);
    print(letter);
  }
=======
  
  public Tile(int startX, int startY, String[][] map){
    xInt = startX;
    yInt = startY;
    rect(xInt*118+90, yInt*118+285, 116, 116, 28);
    letter =map[xInt][yInt];
  }
>>>>>>> d3775dd1c59e8bff38169c1de2a4fbc3171ad24f
}
