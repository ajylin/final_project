import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 0;

// maps
public String[][] map = new String[4][4];

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
void maps() {
  if (mode == 0) {
    String[] row = new String[4];
    row = loadStrings("maps/map1.txt");
    for (int i = 0; i<4; i++){
    }
    System.out.println(row);
    for (int indexR = 0; indexR < 4; indexR++) {
      for (int indexC = 0; indexC < 4; indexC++) {
        map[indexR][indexC] = row[indexR].substring(indexC, indexC++);
      }
    }
  }
  if (mode == 1) {
    String[] row = loadStrings("maps/map2.txt");
    for (int indexR = 0; indexR < 4; indexR++) {
      for (int indexC = 0; indexC < 4; indexC++) {
        map[indexR][indexC] = row[indexR].substring(indexC, indexC++);
      }
    }
   }
  if (mode == 2) {
    String[] row = loadStrings("maps/map3.txt");
    for (int indexR = 0; indexR < 4; indexR++) {
      for (int indexC = 0; indexC < 4; indexC++) {
        map[indexR][indexC] = row[indexR].substring(indexC, indexC++);
      }
    }
  }
}

void setup() {
  size(650, 800);
  width = 650;
  height = 800;
  dictionaries();
  maps();
  System.out.println(mode);
  for (int i = 0; i<4; i++){
    for (int j = 0; j<4; j++){
      System.out.println(map[i][j]);
    }
  }
  board();
}

void draw() {
  background(179, 215, 146);
  fill(51, 105, 3);
  //board();
  score();
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
      for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 4; col++) {
          tile.line(map);
        }
      }
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
