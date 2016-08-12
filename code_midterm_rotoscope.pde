// CODE MIDTERM
// Rotoscoping
//
// This sketch loads the assigned frames and plays them back
// Add your own draw code
// Then it saves out the rendered frames
//
// DON'T FORGET TO CHANGE THE VALUE OF THE STUDENTNAME VARIABLE TO YOUR NAME!!

import java.io.File;

File[] tempfiles;
ArrayList<File> files;
PImage image;
String currentFilename;

//Pac-man
//Location
//circle pac man
//credit to OpenPrecssing
float ang1, ang2, ang3, ang4, ang5, ang6;
float incr1, incr2, incr3, incr4, incr5, incr6, strt, adj;

//pac man normal
float X = 360;
float Y = 260;
float Z = 180;
color col1, col2, col3;

//ghost
PImage img;
   
 //background  
int numCircles=80; 
Circle[] circles;










// EDIT THIS LINE WITH YOUR NAME!
String studentName = "Hanyu Zhao";

void setup() {
  img = loadImage("pac-man.png");
 smooth();

strokeWeight(3); // boundaries thicker
  circles = new Circle[numCircles]; // create the array of the given size
  for (int i=0; i<numCircles; i++) {
    // now create circles according to the given definition, use random numbers as values
    circles[i] = new Circle(random(900),random(540),random(100),random(255));
  }


   noStroke();
  strt = 500;
  adj = 10;
   
  incr1 = random(-.01, .09);
  incr2 = random(-.01, .09);
  incr3 = random(-.01, .09);
  incr4 = random(-.01, .09);
  incr5 = random(-.01, .09);
  incr6 = random(-.01, .09);



  files = new ArrayList<File>();

  // get list of files from directory
  File dir = new File(sketchPath() + "/rawFrames");
  tempfiles = dir.listFiles();

  // filter out files that don't end in .png
  for (int i = 0; i < tempfiles.length; i++) {
    String path = tempfiles[i].getAbsolutePath();
    if (path.toLowerCase().endsWith(".png")) {
      files.add(tempfiles[i]);
    }
    
  }

  // Resize the canvas to full-HD 1080p glory
  size(960, 540);
  pixelDensity(2);
  
  // if that doesn't work, comment it out and uncomment this instead:
  //size(1920, 1080);
  //pixelDensity(1);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    adj += 1;
    if (adj > 20) adj = 5;
  }
}

void draw() {
  // DO NOT ALTER THE LINE BELOW
  prepare();

  // BEGIN ADDING YOUR CODE HERE -----

for (int i=0; i<numCircles; i++) {
    circles[i].render(); 
  }


  //ghost
image(img,  mouseX,mouseY,80, 80);  
  //pac man Y
Y = Y +56*(2+0.4);
col2 = color(random(254),random(100),random(100));
if(Y <= width - 100){
fill(col2);
noStroke();
//arc(a, b, c, d, start, stop, mode)
arc(Y, 280, 60, 60,PI/4, 7*PI/4);}

//pac manZ
Z = Z +50*(2+0.2);
col3 = color(random(100),random(100),random(255));
if(Z <= width - 100){
fill(col3);
noStroke();
arc(Z, 470, 80, 80, PI/4, 7*PI/4);}


  
  
//pac 01
col1 = color(random(256),random(256),random(256));
  translate(X, 380);
  fill(0);
   X = X +56*(2+0.3);
  arc(X, 380, strt/5, strt/5,PI/4, 7*PI/4);
 
  rotate(ang1);
  translate(-adj, 0);
  fill(col1);
  arc(0, 0, strt/5-adj*2, strt/5-adj*2,PI/4, 7*PI/4);
 
  rotate(ang2);
  translate(-adj, 0);
  fill(0);
  arc(0, 0, strt/5-adj*4, strt/5-adj*4,PI/4, 7*PI/4);
 
  rotate(ang3);
  translate(-adj, 0);
  fill(col1);
  arc(0, 0, strt/5-adj*6, strt/5-adj*6,PI/4,7*PI/4);
 
  rotate(ang4);
  translate(-adj, 0);
  fill(0);
  ellipse(0, 0, strt/5-adj*8, strt/5-adj*8); 
 
  rotate(ang5);
  translate(-adj, 0);
  fill(col1);
  ellipse(0, 0, strt/5-adj*10, strt/5-adj*10); 
 

 
  ang1 += incr1;
  ang2 += incr2;
  ang3 += incr3;
  ang4 += incr4;
  ang5 += incr5;
  
  





  // STOP ADDING YOUR CODE HERE -----

  // DO NOT ALTER THE LINES BELOW
  if (frameCount < files.size()) { 
    export();
  } else {
    exit();
  }
}

// DO NOT ALTER THIS FUNCTION!!
void prepare() {
  String path = files.get(frameCount-1).getAbsolutePath();
  currentFilename = files.get(frameCount-1).getName();

  // Load current file into our PImage variable
  tint(255, 255);
  image = loadImage(path);
  image(image, 0, 0, width, height);
}


// DO NOT ALTER THIS FUNCTION!!
void export() {
  // saves frame without watermark
  saveFrame(sketchPath() + "/outFrames/edited_" + currentFilename);

  int sidePadding = 125;
  int bottomPadding = 50;
  
  textAlign(LEFT);
  textSize(32);
  fill(255);
  text(studentName, sidePadding + 1, height - bottomPadding + 1);
  fill(0);
  text(studentName, sidePadding, height - bottomPadding);

  // saves frame with watermark
  saveFrame(sketchPath() + "/outFrames/watermarked_" + currentFilename);
}