import processing.serial.*; 
import ddf.minim.*;
import java.awt.event.KeyEvent; 
Serial myPort;
int a;
String angle="";
String distance="";
String data="";
int AngleX;
int distanceY;
int getlist1=0;
int getlist2=0;
int Search=1;
void setup() {
  size (1000, 800);
  smooth();
  myPort = new Serial(this,"COM5", 9600);
  myPort.bufferUntil('.'); 
}
void serialEvent(Serial myPort) { 
  data = myPort.readStringUntil('.');
  data = data.substring(0, data.length()-1);
  getlist1 = data.indexOf(",");
  angle= data.substring(0, getlist1);
  distance= data.substring(getlist1+1, data.length()); 
  AngleX = int(angle);
  distanceY = int(distance)*3;
}

void draw() {
  background(000);
  noStroke();
  pushMatrix();
  translate(500, 650);
  noFill();
  strokeWeight(2.2);
  stroke(#00ff00);
  line(-500, 0, 500, 0);
  arc(0, 0, 1000, 1000, PI, TWO_PI);
  arc(0, 0, 820, 820, PI, TWO_PI);
  arc(0, 0, 640, 640, PI, TWO_PI);
  arc(0, 0, 460, 460, PI, TWO_PI);
  arc(0, 0, 280, 280, PI, TWO_PI);
  arc(0, 0, 100, 100, PI, TWO_PI);
  line(0, 0, (-500)*cos(radians(30)), (-500)*sin(radians(30)));
  line(0, 0, (-500)*cos(radians(60)), (-500)*sin(radians(60)));
  line(0, 0, (-500)*cos(radians(90)), (-500)*sin(radians(90)));
  line(0, 0, (-500)*cos(radians(120)), (-500)*sin(radians(120)));
  line(0, 0, (-500)*cos(radians(150)), (-500)*sin(radians(150)));
  line((500)*cos(radians(30)), 0, 500, 0);
  popMatrix();
  stroke(#00ff00);
  line(500, 0, 500, 650);
  textSize(30);
  stroke(000);
  line(500, 650, PI, 640);
  if (distanceY<500) {
    rect(460, 655, 80, 40);
    stroke(#FA0A0A);
    ellipse(AngleX*5.58659, 640-distanceY, distanceY/5, distanceY/5);
    fill(#FA0A0A);
    ellipse(AngleX*5.58659, 640-distanceY, 10, 10);
    fill(#ffffff);
    text(distanceY, 470, 685);
    textSize(15);
    text(distanceY, AngleX*5.5, (620-distanceY));
    text(AngleX, AngleX*5.5, (605-distanceY));
    textSize(20);
    stroke(#00ff00);
    text("X=", 200, 675);
    text("Y=", 200, 695);
    text("Location", 110, 685);
    text(distanceY, 240, 695);
    text(AngleX, 240, 675);
    
  }
  if (distanceY>500) {
    text("Not In Range", 430, 680);
    stroke(255);
    rect(420, 655, 200, 40);
  }
  stroke(255);
}
