import java.io.File;
import java.util.Scanner;

int mode_pos = 1;
ArrayList <String> dictionary = new ArrayList <String>();

void setup(){
  if (mode_pos == 0){
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
  else if (mode_pos == 1){
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
    File file = new File("dict3.txt");
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
