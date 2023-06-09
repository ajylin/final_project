import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// home
int home = 0;

// mode
int mode;

// maps
public String[][] map = new String[4][4];

//dictionaries
String[] dictionary;
public ArrayList<String> usedWords = new ArrayList<String>();
public ArrayList<String> sortedLengths = new ArrayList<String>();

// scores
int words = 0;
int score = 0;

// tiles
public Tile[] tiles = new Tile[16];

// current word
public String currentWord = "";
public ArrayList<Integer> usedIndexes = new ArrayList<Integer>();

//timer
int startTime;
int currentTime;
int interval = 1000;
String timeStr = "00";

void dictionaries(){
  if (mode == 0){
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
  dictionaries();
  maps();
  System.out.println(mode);
  if (home ==1){
  startTime = millis();
  }
  
}

void draw() {
  //homePage();
  //endPage();
  if (home==0){
    homePage();
  }
  else{    
  background(179, 215, 146);
  score();  
  board();
  currentWord();
  time();
  } 
}

void currentWord(){
  fill (255,255,255);
  rect (80,159,490,100,28);
  fill (51,105,3);
  textSize(50);
  text(currentWord, 100, 225); 
}

void time(){
  currentTime-=millis();
  if(! timeStr.equals("90")){
  if (millis()-startTime>interval){
    currentTime = int(millis()/1000);
    timeStr = nf(currentTime,2);
    startTime = millis();    
  }
  textSize(104);
  text(timeStr,450,118);
  }
  else endPage();
}

void endPage(){
    fill(179, 215, 146);
    rect(0,0,700,800);
    noStroke();
    fill(212, 238, 193);
    rect(145,220,360,95,28);
    fill(23, 50, 2);
    fill(23, 50, 2);
    textSize(100);
    textAlign(CENTER);
    text("Time's Up!", 320,215);
    String endCount = "";
    endCount = "You got " + words+ " words!";
    textSize(35);
    text(endCount, 320, 262);
    String endScore = "";
    endScore = "Final Score: " + score;
    text (endScore, 320,292);
    fill(130, 173, 99);
    rect(70, 340, 510, 315, 28);
    textAlign(LEFT);
    fill(23, 50, 2);
    text("Your Words: ", 95, 385);
    if (words > 0) {
      for (int index = 0; index < 24; index++) {
        if (index / 8 == 0) {
          text(usedWords.get(index), 110, 425 + index*30+2);
            if (index == usedWords.size()-1) {
              break;
            }
        }
        if (index / 8 == 1) {
          text(usedWords.get(index), 260, 425 + (index%8)*30+2);
            if (index == usedWords.size()-1) {
              break;
            }
        }
        if (index / 8 == 2) {
          if (index == 23) {
            break;
          }
          text(usedWords.get(index), 410, 425 + (index%8)*30+2);
          if (index == usedWords.size()-1) {
            break;
          }
        }
      }
    }
    if (words > 23) {
      textSize(20);
      text("and more...", 410, 633);
    }
    textSize(20);
    textAlign(CENTER);
    text("Press 'r' to restart", 325,760);   
  }   

void homePage(){
  textAlign(CENTER);
  textSize(50);
  fill(51,105,3);
  rect(800,600,0,0);
  text("Welcome to Wordhunt!", 325 ,150);
  textAlign(LEFT);
  textSize(35);
  text("How to play: ", 50, 225);
  textSize(20);
  text("- Drag your mouse across the letters to form words.\n- Release your mouse when you think you have a word.\n- If your word is valid, your score will go up!\n- You have 90 seconds to find as many words as possible.\n- The longer the word, the better!", 50,260);
  textSize(35);
  text("Modes: ", 50, 465);
  textSize(20);
  text("- Press 1 for the easiest mode\n- Press 2 for the medium mode\n- Press 3 for the hardest mode.\n - Note: Choose your mode before pressing play!" , 60, 500);
  textAlign(CENTER);
  textSize(20);
  text("Press 's' to start your game.\n Happy hunting!", 325,675);
  textAlign(LEFT);
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
  stroke(51, 105, 3);
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
  home=0;
  usedWords.clear();
  setup();
}

void keyPressed(){
  if (keyPressed){
    if (key=='1'){
      mode = 0;
      dictionaries();
      maps();
    }
    if (key=='2'){
      mode = 1;
      dictionaries();
      maps();
    }
    if (key=='3') {
      mode = 2;
      dictionaries();
      maps();
    }
    System.out.println(mode);
    if (key =='s') home = 1;
    if(key=='r') reset();
    if (key== CODED){
      /*
      if (keyCode == LEFT){
        mode--;
        if (mode <0) mode = 2;
        reset();
      }
      if (keyCode == RIGHT){
        mode++;
        if (mode>2) mode = 0;
        reset();
      }*/
    }  
  }
}

void mouseReleased(){
  boolean inIt = false;
  for (String s : dictionary){
    if (s.equals(currentWord)){
      for (String w :usedWords){
        if (s.equals(w)){
          inIt = true;
        }
      }
      if (!inIt){
        int points = 0;
        if (currentWord.length() == 3) {
          points = 100;
        }
        if (currentWord.length() == 4) {
          points = 400;
        }
        if (currentWord.length() == 5) {
          points = 800;
        }
        if (currentWord.length() == 6) {
          points = 1400;
        }
        if (currentWord.length() == 7) {
          points = 1800;
        }
        if (currentWord.length() == 8) {
          points = 2200;
        }
      score += (points);
      words++;
      /*
        if (words == 1) {
          usedWords.add(s);
        }
        if (words != 1) {
          */
          int wordLength = currentWord.length();
          int insertIndex = usedWords.size();
          for (int index = 0; index < usedWords.size(); index++) {
            if (wordLength > usedWords.get(index).length()) {
              insertIndex = index;
            }
          }
          usedWords.add(insertIndex, s);
        //}
      fill(100, 200, 100);
      textSize(50);
      text(currentWord, 100, 225); 
      text(currentWord, 100, 225);
      text(currentWord, 100, 225);
      text(currentWord, 100, 225);
      text(currentWord, 100, 225);
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

void mouseDragged() {
  if (home==1){
  int newLetter = 0;
  for (int index = 0; index < 16; index++) {
   if (mouseX > tiles[index].xInt + 25 && mouseX < tiles[index].xInt + 96 && mouseY > tiles[index].yInt + 25 && mouseY < tiles[index].yInt+96) {
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
}

boolean alreadyUsed(int index) {
  for(int indexes : usedIndexes) {
    if (indexes == index) {
      return true;
    }
  }
  return false;
}
