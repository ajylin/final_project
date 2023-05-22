import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 2;

// maps
String[] map1 = new String[16];
String[] map2 = new String[16];
String[] map3 = new String[16];

//dictionaries
String[] dictionary;


// scores
int words = 0;
int score = 0;

/*
void createD1() {
  File file = new File("dictionaries/dict2");
  Scanner input = new Scanner(file);
  while (input.hasNextLine()){
    String word = input.nextLine();
    dict2.add(word);
    System.out.println(word);
  }
}
*/

void dictionaries(){
  if (mode == 0){
    dictionary = loadStrings("dictionaries/dict1.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      System.out.println(dictionary[i]);
      }
  }
  else if (mode == 1){
    dictionary = loadStrings("dictionaries/dict2.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      System.out.println(dictionary[i]);
      }
  }
  else{
    dictionary = loadStrings("dictionaries/dict3.txt");
    for (int i = 0 ; i < dictionary.length; i++) {
      System.out.println(dictionary[i]);
      }
  }
}

void setup() {
  size(650, 800);
  width = 650;
  height = 800;
  dictionaries();
}

void draw() {
  background(179, 215, 146);
  fill(51, 105, 3);
  stroke(206, 246, 170);
  strokeWeight(7);
  rect(50, 200, 550, 550, 28);
  for (int startX = 0; startX < 4; startX++) {
    for (int startY = 0; startY < 4; startY++) {
      stroke(51, 105, 3);
      strokeWeight(8);
      fill(241, 222, 189);
      rect(startX*125+75, startY*125+225, 125, 125, 28);
    }
  }
  score();
}

void score(){
  fill (255,255,255);
  rect (52,35,550,120,28);
  fill (51,105,3);
  textSize(30);
  text("Words: " + words, 65, 70);
  textSize(68);
  text("Score: " + score, 65, 130);
}

void reset() {
}


void mousePressed() {
}

void mouseMoved() {
}

void mouseDragged() {
}

void mode1(){
}
/*
void mode2(){
  File file = new File("mode2.txt");
  Scanner input = new Scanner(file);
  String firstLine = input.nextLine();
  for (int index = 0; index < 16; index++) {
    map2[index] = firstLine.substring(index, index++);
  }
  input.close();
}
*/

void mode3(){
}
