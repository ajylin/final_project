import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 2;

// maps
public String[][] map = new String[4][4];

//dictionaries
String[] dictionary;
public ArrayList<String> usedWords = new ArrayList<String>();

// scores
int words = 0;
int score = 0;

// tiles
public Tile[] tiles = new Tile[16];

// current word
public String currentWord = "";
public ArrayList<Integer> usedIndexes = new ArrayList<Integer>();

<<<<<<< HEAD
void dictionaries() {
  if (mode == 0) {
=======
//timer
int startTime;
int currentTime;
int interval = 1000;
String timeStr = "00";

// font
PFont mono;

void dictionaries(){
  if (mode == 0){
>>>>>>> cd6a95d61840b84bc935cecd3640acc6a8f87b11
    dictionary = loadStrings("dictionaries/dict1.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      //System.out.println(dictionary[i]);
      }
  }
  else if (mode == 1) {
    dictionary = loadStrings("dictionaries/dict2.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      //System.out.println(dictionary[i]);
      }
  }
  else {
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
  usedWords.clear();
  dictionaries();
  maps();
  startTime = millis();
}

void draw() {
  background(179, 215, 146);
  score();  
  board();
  currentWord();
  time();
}

void currentWord(){
  fill (255,255,255);
  rect (80,159,480,100,28);
  fill (51,105,3);
  textSize(50);
  text(currentWord, 100, 215); 
}

void time(){
  if(! timeStr.equals("02")){
  if (millis()-startTime>interval){
    currentTime = int(millis()/1000);
    timeStr = nf(currentTime,2);
    startTime = millis();    
  }
  textSize(104);
  text(timeStr,450,118);
  }
  else{
    fill(51,105,3);
    rect(0,0,700,800);
    fill(0,0,0);
    textSize(100);
    textAlign(CENTER);
    text("Congrats!",300,100);
    text("You got", 300, 200);
    text(words, 300,300);
    text("words!",300,400);
    text ("Your score was:", 320,500);
    text(score, 300,600);
    
  }
 
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


void score() {
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
/*
void mousePressed() {
  for (int index = 0; index < 16; index++) {
<<<<<<< HEAD
      if (mouseX > tiles[index].xInt + 20 && mouseX < tiles[index].xInt + 96 && mouseY > tiles[index].yInt + 20 && mouseY < tiles[index].yInt+96) {
        usedIndexes.add(index); 
        tiles[index].glow(tiles[index].xInt, tiles[index].yInt);
        currentWord += tiles[index].letter;
        System.out.println(tiles[index].letter);
      }
  }
}

void mouseReleased() {
=======
      if (mouseX > tiles[index].xInt + 30 && mouseX < tiles[index].xInt + 90 && mouseY > tiles[index].yInt + 30 && mouseY < tiles[index].yInt+90) {
        tiles[index].glow = true;
        //usedIndexes.add(index); 
        currentWord += tiles[index].letter;
        //System.out.println(tiles[index].letter);
  }
  }  
}*/
void mouseReleased(){
  boolean inIt = false;
>>>>>>> cd6a95d61840b84bc935cecd3640acc6a8f87b11
  for (String s : dictionary){
    if (s.equals(currentWord)){
      for (String w :usedWords){
        if (s.equals(w)){
          inIt = true;
        }
      }
      if (!inIt){
      score += ((currentWord.length()-2) *100);
      words++;
      usedWords.add(s);
      fill(100, 200, 100);
      textSize(50);
      text(currentWord, 100, 215); 
      text(currentWord, 100, 215);
      text(currentWord, 100, 215);
    }
    }
  }
  currentWord = "";
  for (int i:usedIndexes){
    tiles[i].glow = false;
  }
  usedIndexes.clear();
  //usedWords.clear();
}

void mouseMoved() {
}

void mouseDragged() {
  int newLetter = 0;
  for (int index = 0; index < 16; index++) {
<<<<<<< HEAD
    if (mouseX > tiles[index].xInt+20 && mouseX < tiles[index].xInt + 96 && mouseY > tiles[index].yInt+20 && mouseY < tiles[index].yInt + 96) {
=======
   if (mouseX > tiles[index].xInt + 25 && mouseX < tiles[index].xInt + 96 && mouseY > tiles[index].yInt + 25 && mouseY < tiles[index].yInt+96) {
>>>>>>> cd6a95d61840b84bc935cecd3640acc6a8f87b11
      if (alreadyUsed(index) == false) {
       tiles[index].glow = true;
        usedIndexes.add(index);
        tiles[index].glow(tiles[index].xInt, tiles[index].yInt);
        currentWord += tiles[index].letter;
        //System.out.println(currentWord);
        //print(tiles[index].letter);
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
