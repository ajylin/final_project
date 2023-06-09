import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// home
int home =0;
// mode
int mode;

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

//timer
int startTime;
int currentTime;
int interval = 1000;
String timeStr = "00";


// screens
int home = 2;

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
  System.out.println(mode);
  if (home ==1){
  startTime = millis();
  }
  
}

void draw() {
<<<<<<< HEAD
  if (home == 0) {
    //
  }
  if (home == 1) {
    inGame();
  }
  if (home == 2) {
    endScreen();
  }
}

void inGame() {
    background(179, 215, 146);
    score();  
    board();
    currentWord();
    time();
=======
  //homePage();
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
  
>>>>>>> 9ee94024b12dc2a917e4732506381a2410cd814f
}

void currentWord(){
  fill (255,255,255);
  rect (80,159,480,100,28);
  fill (51,105,3);
  textSize(50);
  text(currentWord, 100, 215); 
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
    fill(51,105,3);
    rect(0,0,700,800);
    fill(0,0,0);
    textSize(100);
    textAlign(CENTER);
    text("Congrats!",300,100);
<<<<<<< HEAD
    text("You got", 300, 200);
    text(words, 300,300);
    text("words!",300,400);
    text ("Your score was:", 320,500);
    text(score, 300,600);
    
  }
}

=======
    text("You got", 300, 180);
    text(words, 300,260);
    text("words!",300,340);
    text ("Your score was:", 320,420);
    text(score, 300,500);
    textSize(40);
    text("Press 'r' to restart", 300,580);    
  }   

void homePage(){
  textAlign(LEFT);
  textSize(25);
  fill(51,105,3);
  rect(800,600,0,0);
  text("Welcome to Wordhunt!",10 ,20);
  text("How to play: ", 10, 50);
  text("-Drag your mouse across the letters to form words\n-Release your mouse when you think you have a word\n-If your word is valid, your score will go up!\n-You have 90 seconds to find as many words as possible.\n-The longer the word, the better", 10,80);
  text("Modes: ", 10, 300);
  text("-Press 1 for the easiest mode\n-Press 2 for the medium mode\n-Press 3 for the hardest mode." , 10, 320);
  text("Press 's' to start your game.", 10,500);
}

>>>>>>> 9ee94024b12dc2a917e4732506381a2410cd814f
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

<<<<<<< HEAD
void score(){
=======

void score() {
  stroke(51, 105, 3);
>>>>>>> 9ee94024b12dc2a917e4732506381a2410cd814f
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
        score += ((currentWord.length()-2) *100);
        words++;
        usedWords.add(s);
    }
    }
  }
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

void endScreen() {
      background(179, 215, 146);
      textSize(50);
      text(currentWord, 100, 300); 
      text(currentWord, 100, 500);
      text(currentWord, 100, 600);
      currentWord = "";
}
