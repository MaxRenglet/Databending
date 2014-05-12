
PImage a;  // Declare variable "a" of type PImage

PFont font;
String yourString = "//_I_HATE_MUSIC_//"; //Sentence to put into the data
String image_source = "glitch.mp3";
String image_inter = "glitch.jpg";
String image_sortie = "glitch2.mp3";

void setup() {

  byte[] data=loadBytes(image_source);

  
  saveBytes(image_inter, data);
  size(100, 100);

  font = createFont("Courrier", 12);
}

void draw() {

  background(255);
  textFont(font);
  char[] data2 = new char[yourString.length()];
  for (int m = 0; m < yourString.length(); m++) {
    data2[m] = yourString.charAt(m);
  }

  byte[] data=loadBytes(image_inter);
  char [] image2 = new char[data.length];

  String [] image3 = new String[data.length];

  for (int k = 0; k < 180000; k++) {

    int loc=(int)random(128, data.length);//guess at header being 128 bytes at most..

    for (int i = 0; i < data2.length;i++) {

      data[loc+i]=(byte)data2[i];
    }
  }

  for (int n = 0; n < data.length;n++) { 
    image2[n] = char(data[n]);
    image3[n] = str(image2[n]);
  }

  String teste2 = join(image3, "");
  String s2 = teste2.replaceAll("\\s+", "");
  String s3 = s2.replaceAll("[^\\x21-\\x7e]", "");
  String s4 [] = splitTokens(s3, "");

  saveBytes(image_sortie, data);
  saveStrings("test.txt", s4);

  println("FINISH");
  exit();
}
