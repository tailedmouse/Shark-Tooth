// SharkTooth
/* 
 
 SO FAR:
 
 - We have a free rotation.
 - A triangle within another triangle
 - A Subclass of the triangle
 - A Scroll bar
 - Orthographic View
 
 What Glitches and Why?
 
 - The Texture works, but it glitches because we have
 to use scale to make the triangle bigger.
 - Freely adding the Triangle as we please. I don't know how to 
 dynamically access the class
 - Changing colors doesn't work, because the way it's set up
 - Since Processing works from up to down, we can't give indivual 
 free scaling to each of the triangle with out doing tons shit of
 trial and error
 - Orthographic of a canavas doens't work with normal rotate, 
 we will have to learn how to use a default prespective cameras
 
 
 
 How to add Classes?
 
 - Just click on the arrow on the tab bar and click on new tab.
 Name the class, and in it, write " class NameOfClass { } "
 
 How to add Pictures?
 
 - Just drag and drop the picture into the processing window
 
 Taking Snap Shots && Facebook Upload
 
 - I found this:
 http://forum.processing.org/one/topic/get-screencapture.html
 
 http://stackoverflow.com/questions/3109283/android-upload-photo-to-facebook-with-facebook-android-sdk/4955645#4955645
 
 But this is for a Desktop, but in general, we will need to learn
 a little bit about how bitmap arrays work, unless we find a library!
 
 */

HScrollbar hs1; // Scroll Bar (calliung from the class)
Triangles tr1, tr2; // Creating 2 triangles (calling form the class)

PImage one, two, three; // OrthoGraphic Buttons

// Setting up Values

void setup()
{
  size(700, 700, P3D); // 3d Canvas
  smooth(); // Anti-ALias
  hs1 = new HScrollbar(0, 650, width, 16, 16);
  tr1 = new Triangles () ; // Initiating Triangle
  tr2 = new Triangles () ; // Initiating triangle
  one = loadImage("ButtonOne.png");  // Load the image into the program  
  two = loadImage("ButtonTwo.png");  // Load the image into the program  
  three = loadImage("ButtonThree.png");  // Load the image into the program
}

// Drawing stuff!

void draw ()
{
  float rotation = hs1.getPos()-width/2; // Getting Rotation value for the slider

  background(0); // Refreshing screen
  int xOrtho = width/2-150; // Placement of buttons
  int yOrtho = 30; //Placement of buttons
  image(one, xOrtho, yOrtho); //Assigning x,y to ButtonOne
  xOrtho += 100; // Incrementing x coordinate of buttons for values
  image(two, xOrtho, yOrtho); //Assigning x,y to ButtonTwo
  xOrtho += 100; // Incrementing X coordinate of Buttons for values
  image(three, xOrtho, yOrtho); //Assigning x,y to ButtonThree
  hs1.update(); // Calling .update in scroll bar
  hs1.display(); // Calling .display in scroll bar
  translate(width/2, height/2-50, 0); // Translating the Triangles
  scale (20); // Scaling the Triangles

  if (mousePressed) {

    // This checks if the mouse is on the buttons, if it is, it changes it to that orthographic view
    if (mouseX > xOrtho-350 && mouseX < xOrtho+300 && 
      mouseY > yOrtho  && mouseY < yOrtho+50) {

      rotateY ((TWO_PI/3)+33);
    }

    //Samething but for Button Two
    else if (mouseX > xOrtho-250 && mouseX < xOrtho+200 && 
      mouseY > yOrtho  && mouseY < yOrtho+50) {
      rotateY (4*(PI/3)+33);
    }

    //For Button Three
    else if (mouseX > xOrtho-150 && mouseX < xOrtho+100 && 
      mouseY > yOrtho  && mouseY < yOrtho+50) {
      rotateY ((TWO_PI)+33);
    }

    // If it's anywhere else change it to scroll bar 
    else {
      rotateY(rotation/50);
    }
  }
  // This is repeated so it just holds the vlaue of free rotation
  else {
    rotateY(rotation/50);
  }

  tr1.display (); // Display Triangle One
  scale (2); // Scale Triangle 2
  tr2.display (); // Display Triangle 2
}

// This was a processing class

class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } 
    else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

// i created this!

class Triangles {

 Triangles () {
}

void display (){

  fill(25, 98, 120, 100);
  ambientLight(0, 0, 255);
  lights();
 
  
  beginShape();
  stroke(255, 255, 266);
  vertex(0, 4, 0);
  vertex( -1.5, 0, -2.5);
  vertex(-1.5, 0, 2.5);

  vertex(0, 4, 0);
  vertex(-1.5, 0, 2.5); 
  vertex( 3, 0, 0); 

  vertex(0, 4, 0);
  vertex( 3, 0, 0);
  vertex(-1.5, 0, -2.5); 

  endShape();
}

}

