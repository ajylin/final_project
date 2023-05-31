import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 0;

// maps
public String[][] map = new String[4][4];

//dictionaries
String[] dictionary;

//tiles
Tile tile0 = new Tile(0, 0, map);
Tile tile1 = new Tile(1, 0, map);
Tile tile2 = new Tile(2, 0, map);
Tile tile4 = new Tile(3, 0, map);
Tile tile5 = new Tile(0, 1, map);
Tile tile6 = new Tile(1, 1, map);
Tile tile7 = new Tile(2, 1, map);
Tile tile8 = new Tile(3, 1, map);
Tile tile9 = new Tile(0, 2, map);
Tile tile10 = new Tile(1, 2, map);
Tile tile11 = new Tile(2, 2, map);
Tile tile12 = new Tile(3, 2, map);

// scores
int words = 0;
int score = 0;


void dictionaries(){
  if (mode == 0){
    dictionary = loadStrings("dictionaries/dict1.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      //System.out.println(dictionary[i]);
      }
  }
  else if (mode == 1){
    dictionary = loadStrings("dictionaries/dict2.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      //System.out.println(dictionary[i]);
      }
  }
  else{
    dictionary = loadStrings("dictionaries/dict3.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      //System.out.println(dictionary[i]);
      }
  }
}
void maps() {
  String [] tempMap = new String [4];
  int start = 0;
  int xPos = 0;
  int yPos = 0;
  if (mode ==0){
    tempMap = loadStrings("maps/map1.txt");
    for (String s : tempMap){
      System.out.println(s);
    }
    }
   if (mode ==1){
    tempMap = loadStrings("maps/map2.txt");
    for (String s : tempMap){
      System.out.println(s);
    }
   }
   if (mode ==2){
    tempMap = loadStrings("maps/map3.txt");
    for (String s : tempMap){
      System.out.println(s);
    }
   }
    
    for (int row = 0; row <4; row++){
      for (int col = 0; col<4; col++){
        map[row][col] = tempMap[row].substring(col, col+1);
      }
    }
}

void setup() {
  size(650, 800);
  background(179, 215, 146);
  fill(51, 105, 3);
  width = 650;
  height = 800;
  dictionaries();
  maps();
  board();
}

void draw() {
  score();  
}

void board() {
  stroke(206, 246, 170);
  strokeWeight(7);
  int tileNum = 0;
  rect(80, 275, 490, 490, 28);
  //Tile 
  /*
  for (int startX = 0; startX < 4; startX++) {
    for (int startY = 0; startY < 4; startY++) {
      Tile tile = new Tile(startX, startY, map);
      tileNum++;
    }
  }
  */
  System.out.print(tileNum);
}


void score(){
  fill (255,255,255);
  rect (80,35,490,105,28);
  fill (51,105,3);
  textSize(25);
  text("Words: " + words, 95, 75);
  textSize(50);
  text("Score: " + score, 95, 120);
}

void reset() {
  score = 0;
  words = 0;
  setup();
}

void keyPressed(){
  if (keyPressed){
    if (key== CODED){
      if (keyCode == LEFT){
        mode--;
        if (mode <0) mode = 2;
        reset();
      }
      if (keyCode == RIGHT){
        mode++;
        if (mode>2) mode = 0;
        reset();
      }
    }  
  }
}

void mousePressed() {
}

void mouseMoved() {
}

void mouseDragged() {
  
}
