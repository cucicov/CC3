
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

int[] data = new int[100];


void setup() {
  size(500, 500);
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);

}

void keyPressed() {
  fill(color(random(255), random(255), random(255)));
}

void mousePressed() {
  rect(mouseX, mouseY, 10, 10);
  int[] data = {mouseX, mouseY};
  sendOsc(data);
}

void draw() {
  
  rect(0, 0, 30, 30);
  
}

void sendOsc(int[] px) {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add((float)px[0]); 
  msg.add((float)px[1]);
  
  println(px);
  
  oscP5.send(msg, dest);
}
