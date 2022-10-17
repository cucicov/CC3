import processing.video.*;
import oscP5.*;
import netP5.*;

Capture cam;

OscP5 oscP5;
NetAddress dest;

int[] data = new int[100];

void setup() {
  size(500, 500);
  noStroke();
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);

    cam = new Capture(this, "pipeline:autovideosrc");
    cam.start();     
  //}      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  
  getPixelData();
  
  //sendOsc(data);
  
}

int[] getPixelData() {
  int count = 0;
  
  for(int xStep = 0; xStep < 10; xStep++) {
    for (int yStep = 0; yStep < 10; yStep++) {
      
      int currentX = xStep * 50;
      int currentY = yStep * 50;
      
      data[count] = 0;
      
      for (int x = 0; x < 50; x += 12) {
        for (int y = 0; y < 50; y += 12) {
           data[count] = (int) (data[count] + brightness(get(currentX + x,currentY + y))) / 2;
        }
      }
      
      fill(data[count]);
      rect(currentX, currentY, 50, 50);
      
      count++;
    }
  }
  
  return data;
}
