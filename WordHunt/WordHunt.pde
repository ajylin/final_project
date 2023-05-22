import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

// maps
String[] map1 = new String[16];
String[] map2 = new String[16];
String[] map3 = new String[16];

//dictionaries
ArrayList<String> dict1 = new ArrayList<String>();
ArrayList<String> dict2 = new ArrayList<String>();
ArrayList<String> dict3 = new ArrayList<String>();

/*
void createD1() {
  File file = new File("modes/mode2");
  Scanner input = new Scanner(file);
  input.nextLine();
  while (input.hasNextLine()){
    String word = input.nextLine();
    dict2.add(word);
    System.out.println(word);
  }
}
*/

void setup() {
  size(650, 800);
  width = 650;
  height = 800;
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

void mode2(){
  File file = new File("modes/mode2.txt");
  Scanner input = new Scanner(file);
  String firstLine = input.nextLine();
  for (int index = 0; index < 16; index++) {
    map2[index] = firstLine.substring(index, index++);
  }
}

void mode3(){
}
