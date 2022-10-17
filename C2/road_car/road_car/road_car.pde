import ddf.minim.*;
import oscP5.*;
import netP5.*;

Minim minim;
AudioPlayer a,b;

PImage you,others,ert,car,car2,licence;
float rt;
PFont myFont;

int r=0;

int s=0;

int p=0;

int []dvy={-50,100,250,400,550,700,900};

int dvp=2;

int x=350,y=800;
int rx1(){
 return int(random(175,315));
}
int rx2(){
 return int(random(385,525));
}
int ry(){
 return int(random(-60,-59));
}
int rs(){
  return int(random(2));
}
int[]cx={rx1(),rx1(),rx2(),rx2()};
int[]cx1={rx1(),rx1(),rx2(),rx2()};
float[]cy={-59,-200,-350,-600};
float[]cyr={-59,-200,-350,-600};

int scr;

int k=0;

int roadside =rs();

float m=5;

float d=m;

float n=0.001;


int pos=0;


OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
size(700,900);
oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
myFont = createFont("System", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  you=loadImage("1.png");
  ert=loadImage("earth.png");
  car=loadImage("car.png");
  car2=loadImage("car2.png");
  licence=loadImage("lic.png");
  others=loadImage("2.jpg");
  minim = new Minim(this);
  a = minim.loadFile("aaa.mp3");
  b = minim.loadFile("gg.mp3");
  for(int i=0;i<=3;i++){
  cy[i]=ry();
  cx[i]=p;
  }
}
void draw(){
  background(0,150,0);
  if(k==1){
    d=0;
    n=0;
    dvp=0;
  }
  if(k==0){
    d=m;
    n=.001;
    dvp=2;
  }
 //println(d);
  imageMode(CENTER); 
  if(r==0){
  fill(0);
   textSize(50);
  text("Press r to start",width/2,height/2);
  }
  if(r==1){
    gameover();
  }
  if(r==2){
  rectMode(CENTER);
  fill(100);
  rect(350,450,400,900);
  for(int i=0;i<=6;i++){
     fill(255);
     noStroke();
     rect(width/2,dvy[i],20,100);
  }
  for(int i=0;i<=6;i++){
     dvy[i]+=dvp;
     if(dvy[i]>=950){
       dvy[i]=-50;
     }
  }
  image(you,x,y);
  for(int i=0;i<=3;i++){
  image(others,cx[i],cy[i]);
  }
  fill(0);
   textSize(50);
  text(scr,70,200);
  m+=n;
  for(int i=0;i<=3;i++){
  cy[i]+=d;
  }
  for(int i=0;i<=3;i++){
  if(cy[i]>=959){
    scr+=5;
  cy[i]=ry();
  roadside=rs();
  if(roadside==0){
  cx[i]=rx1();
  }
  if(roadside==1){
  cx[i]=rx2();
  }
  }
  }
  if(x>=521){
  x=521;
  }
  else if(x<=179){
  x=179;
  }
  if(y>=840){
  y=840;
  }
  else if(y<=60){
  y=60;
  }
  for(int i=0;i<=3;i++){
    if(cy[i]>=(y-117) && cy[i]<=(y+117) && cx[i]>=(x-46) && cx[i]<=(x+46)){
    gameover();
    }
}

  }
}

void keyPressed(){

  if(keyCode == 32){
     k=1;
  }

  if(s==0){ 
  a.rewind();
  a.play();
  }  
if(keyCode==RIGHT){
x+=d;
}
else if(keyCode==LEFT){
x-=d;
}
else if(keyCode==UP){
y-=d;
}
else if(keyCode==DOWN){
y+=d;
}
if(key=='r'){
r=2;
scr=0;
reset();
m=5;d=m;
s=0;
}
}

void keyReleased(){

  k=0;
if(s==0){ 
  minim.stop();
  a = minim.loadFile("aaa.mp3");
  b = minim.loadFile("gg.mp3");
}
  
}
void mousePressed(){println(mouseY);}
void gameover(){

b.play();
 r=1;
 
fill(0);
if(scr<=49){
 image(car2,350,462);
textSize(50);
text("Not good",350,100);
  text("Your score :",350,150);
  text(scr,350,300);
textSize(10);
  text("PRESS R TO RESTART",350,350);
  textSize(30);
  text("You failed in test. We can't give you licence",350,602);
}
if(scr>=50){
  pushMatrix();
 translate(350,1200);
 rotate(rt);
 rt+=.01;
 image(ert,0,0);
 popMatrix();
 image(licence,350,125);
 image(car,350,462);
textSize(30);
text("You got a licence !",350,270);
  text("Your score :",350,320);
  text(scr,350,370);
textSize(10);
  text("PRESS R TO RESTART",350,400);
}
s++;
reset();
}
void reset(){
x=350;
y=800;
d=5;
for(int i=0;i<=3;i++){
cx[i]=cx1[i];
cy[i]=cyr[i];
}
}

void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.get(0).floatValue() == 1.0){
    x+=d;
  } else if(theOscMessage.get(0).floatValue() == 2.0){
    x-=d;
  }
}
