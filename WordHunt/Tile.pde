class Tile {
  public String letter;
  public int xInt;
  public int yInt;
  
  public Tile(int startX, int startY, String[][] map){
    xInt = startX;
    yInt = startY;
    rect(xInt*118+90, yInt*118+285, 116, 116, 28);
    letter =map[xInt][yInt];
<<<<<<< HEAD
    //fill(0, 0, 0);
    //text(letter, xInt*188+90+58, yInt*118+285+58);
  }
=======
    text(letter, xInt*188+90+58, yInt*118+285+58);
    print(letter);
  }
  
  public void line(String[][] map) {
    String letter = map[xInt][yInt];
    //System.out.println(letter);
    text(letter, xInt*188+90+58, yInt*118+285+58);
}
>>>>>>> 4fb0d9a96828a3a0e9da905e99a9c6578b45fe75
}
