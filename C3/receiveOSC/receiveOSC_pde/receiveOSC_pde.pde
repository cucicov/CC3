
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
size(700,900);
oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
   
  // given start time, duration, and frequency
  
}

void draw() {
  
}

void oscEvent(OscMessage theOscMessage) {
  
  println(theOscMessage.get(0).floatValue());
}
