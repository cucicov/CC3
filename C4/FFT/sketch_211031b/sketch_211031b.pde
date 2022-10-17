import processing.sound.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

FFT fft;
AudioIn in;
int bands = 32;
float[] spectrum = new float[bands];
int barWidth = 10;

void setup() {
  size(512, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);

  for(int i = 2; i < bands; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  strokeWeight(10);
  line(i*10, height, i*10, height - spectrum[i]*height*5 );
    //rect(i*barWidth, height, barWidth, -spectrum[i]*height*5);
  } 
  
  sendOsc(spectrum);
  delay(100);
  print(spectrum);
  println("---");
}

void sendOsc(float[] px) {
  OscMessage msg = new OscMessage("/wek/inputs");
  
  for (int i=0; i<px.length; i++) {
    msg.add(px[i]); 
  }
  
  oscP5.send(msg, dest);
}
