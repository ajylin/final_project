import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// mode
int mode = 1;

// maps
String[] map1 = new String[16];
String[] map2 = new String[16];
String[] map3 = new String[16];

//dictionaries
ArrayList <String> dictionary = new ArrayList <String>();

// scores!
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
    try{
    File file = new File("dictionaries/dict1.txt");
    Scanner sc = new Scanner (file);
    while (sc.hasNext()){
      dictionary.add(sc.next());     
    }
    }
    catch (IOException e){
      System.out.println(e);
    }
  }
  else if (mode == 1){
    try{
    File file = new File("dictionaries/dict2.txt");
    Scanner sc = new Scanner (file);
    while (sc.hasNext()){
      dictionary.add(sc.next());     
    }
    }
    catch (IOException e){
      System.out.println("Problem opening file.");
    }
  }
  else{
        try{
    File file = new File("dictionaries/dict3.txt");
    Scanner sc = new Scanner (file);
    while (sc.hasNext()){
      dictionary.add(sc.next());     
    }
    }
    catch (IOException e){
      System.out.println("Problem opening file.");
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
  rect (52,35, 550, 120, 28);
  fill(51, 105, 3);
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
