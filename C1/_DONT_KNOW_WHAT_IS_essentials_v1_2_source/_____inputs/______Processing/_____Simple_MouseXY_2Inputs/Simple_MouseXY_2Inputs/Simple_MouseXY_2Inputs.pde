/**
 * REALLY simple processing sketch that sends mouse x and y position to wekinator
 * This sends 2 input values to port 6448 using message /wek/inputs
 **/

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

PFont f;

int DARK = 80;
int LIGHT = 200; // change ellipse color when wekinator detects mouse inside the circle.

int rectSize;
int ellipseColor = DARK;

void setup() {
  f = createFont("Courier", 16);
  textFont(f);

  size(640, 480, P2D);
  noStroke();
  smooth();


  /* start oscP5, listening for incoming messages at port 9000 */
  oscP5 = new OscP5(this, 9000);
  dest = new NetAddress("127.0.0.1", 6448);

  rectSize = (int)random(100, 300);
}

void draw() {
  background(0);

  fill(120);
  rect(0, 0, width/2, height);

  // draw center ellipse
  fill(ellipseColor);
  ellipse(width/2, height/2, rectSize, rectSize);

  fill(255);
  ellipse(mouseX, mouseY, 10, 10);


  // send messages every 2 frames.
  if (frameCount % 2 == 0) {
    sendOsc();
  }
  text("Continuously sends mouse to Wekinator\nUsing message /wek/inputs, to port 6448\n", 10, 30);
  text("x=" + mouseX + ", y=" + mouseY, 10, 100);
}

void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add((float)mouseX);
  //msg.add((float)mouseY);
  oscP5.send(msg, dest);
}
