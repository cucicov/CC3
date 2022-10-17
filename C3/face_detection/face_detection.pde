import processing.video.*;
import oscP5.*;
import netP5.*;
import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;

Capture cam;

OscP5 oscP5;
NetAddress dest;

int[] data = new int[100];

void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, "pipeline:autovideosrc");
  opencv = new OpenCV(this, 640, 480);  
  noStroke();
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);

    
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  cam.start();     
}

void draw() {
  opencv.loadImage(cam);
  image(cam, 0, 0);
  faces = opencv.detect();
  
  println(faces.length);
  
  
  //getPixelData();
  
  //sendOsc(data);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  
}

void captureEvent(Capture c){
  c.read();
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
