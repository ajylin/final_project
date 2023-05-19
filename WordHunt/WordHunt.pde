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

void createD1() {
  File file = new File("dictionaries/dict2");
  Scanner input = new Scanner(file);
  while (input.hasNextLine()){
    String word = input.nextLine();
    dict2.add(word);
    System.out.println(word);
  }
}

void setup() {
}

void draw() {
}

void reset() {
}

void mousePressed() {
}

void mouseMoved() {
}

void mouseDragged() {
}
