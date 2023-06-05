import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 2;

// maps
public String[][] map = new String[4][4];

//dictionaries
String[] dictionary;

// scores
int words = 0;
int score = 0;

// tiles
public Tile[] tiles = new Tile[16];

// current word
public String currentWord = "";
public ArrayList<Integer> usedIndexes = new ArrayList<Integer>();



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
}

void draw() {
  background(179, 215, 146);
  score();  
  board();
  currentWord();
}

void currentWord(){
  fill (255,255,255);
  rect (80,159,480,100,28);
  fill (51,105,3);
  textSize(50);
  text(currentWord, 100, 215); 
}

void board() {
  stroke(206, 246, 170);
  strokeWeight(7);
  int tileNum = 0;
  rect(80, 275, 490, 490, 28);
  for (int startY = 0; startY < 4; startY++) {
    for (int startX = 0; startX < 4; startX++) {
      tiles[tileNum] = new Tile(startX, startY, map);
      tileNum++;
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
  for (int index = 0; index < 16; index++) {
      if (mouseX > tiles[index].xInt + 20 && mouseX < tiles[index].xInt + 96 && mouseY > tiles[index].yInt + 20 && mouseY < tiles[index].yInt+96) {
        usedIndexes.add(index); 
        tile[index].glow(tile[index].xInt, tile[index].yInt);
        currentWord += tiles[index].letter;
        System.out.println(tiles[index].letter);
  }
  }  
}

void mouseReleased(){
  for (String s : dictionary){
    if (s.equals(currentWord)){
      score += ((currentWord.length()-2) *100);
      words++;
    }
    currentWord = "";
  }
  usedIndexes.clear();
}

void mouseMoved() {
}

void mouseDragged() {
  int newLetter = 0;
  for (int index = 0; index < 16; index++) {
    if (mouseX > tiles[index].xInt && mouseX < tiles[index].xInt + 116 && mouseY > tiles[index].yInt && mouseY < tiles[index].yInt + 116) {
      if (alreadyUsed(index) == false) {
        usedIndexes.add(index);
        tile[index].glow(tile[index].xInt, tile[index].yInt);
        currentWord += tiles[index].letter;
        print(tiles[index].letter);
      }
    }
  }
}

boolean alreadyUsed(int index) {
  for(int indexes : usedIndexes) {
    if (indexes == index) {
      return true;
    }
  }
  return false;
}
