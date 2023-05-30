import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 0;

// maps
String[][] map = new String[4][4];

//dictionaries
String[] dictionary;


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

void setup() {
  size(650, 800);
  width = 650;
  height = 800;
  dictionaries();
  maps();
  
}

void draw() {
  background(179, 215, 146);
  fill(51, 105, 3);
  score();
  board();
}

void board() {
  stroke(206, 246, 170);
  strokeWeight(7);
  rect(80, 275, 490, 490, 28);
  for (int startX = 0; startX < 4; startX++) {
    for (int startY = 0; startY < 4; startY++) {
      stroke(51, 105, 3);
      strokeWeight(7);
      fill(241, 222, 189);
      Tile tile = new Tile(startX, startY, map);
      tile.line();
    }
  }
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
}


void mousePressed() {
}

void mouseMoved() {
}

void mouseDragged() {
}

void maps() {
  if (mode == 0) {
    String[] letters = loadStrings("maps/map1.txt");
    for( int row = 0; row < 4; row++ ){
      for( int col = 0; col < 4; col++ ){
        map[row][col] = letters[row].substring(col, col++);
      }
    }
  }
  if (mode == 1) {
    String[] letters = loadStrings("maps/map2.txt");
    for( int row = 0; row < 4; row++ ){
      for( int col = 0; col < 4; col++ ){
        map[row][col] = letters[row].substring(col, col++);
      }
    }
   }
  if (mode == 2) {
    String[] letters = loadStrings("maps/map3.txt");
    for( int row = 0; row < 4; row++ ){
      for( int col = 0; col < 4; col++ ){
        map[row][col] = letters[row].substring(col, col++);
      }
    }
  }
  for (int i =0; i<4; i++){
      System.out.println(map[i]);
  }
  
}
