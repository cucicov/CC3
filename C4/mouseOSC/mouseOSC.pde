
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

int[] data = new int[100];
int gestureCount = 1;


boolean REC_MODE = true;

void setup() {
  size(500, 500);
  background(0);
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);

}

void keyPressed() {
  if (key == 'r') {
    clear();
    gestureCount++;
  }
  fill(color(random(255), random(255), random(255)));
}

void draw() {
  
  rect(0, 0, 30, 30);
  
  if (mousePressed) {
    // start recording
    if (REC_MODE) {
      OscMessage msg = new OscMessage("/wekinator/control/startDtwRecording");
      msg.add(gestureCount);
      oscP5.send(msg, dest);
    }
    
    rect(mouseX, mouseY, 10, 10);
    int[] data = {mouseX, mouseY};
    sendOsc(data);
  } else {
    // stop recording
    if (REC_MODE) {
      OscMessage msg = new OscMessage("/wekinator/control/stopDtwRecording");
      oscP5.send(msg, dest);
    }
  }
  
}

void sendOsc(int[] px) {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add((float)px[0]); 
  msg.add((float)px[1]);
  
  println(px);
  
  oscP5.send(msg, dest);
}
