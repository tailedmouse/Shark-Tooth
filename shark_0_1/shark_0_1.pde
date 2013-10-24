//Path WAZ HERE!
float x = 0.5*PI;

void setup()
{
  size(360, 360, P3D);
  background(255);
  smooth();
 
  
}
void draw ()
{
  background(255);
  if (mousePressed){
    
    if (x >= 2*PI ) {
    x ++;
    }
    camera(x+120, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  }
     ambientLight(0,0,255);
     lights();
  translate(width/2, height/2, 0);
  rotateX(0);
  rotateY(0);
  scale(50);
  beginShape();
  
  fill(255,25,25);
  stroke(0,0,0,0);
  vertex(0, 4, 0);
  vertex( -1.5, 0, -2.5);
  vertex(-1.5, 0, 2.5);
  
  vertex(0,4,0);
  vertex(-1.5, 0, 2.5); 
  vertex( 3, 0, 0); //
  
  vertex(0,4,0);
  vertex( 3, 0, 0);
  vertex(-1.5, 0, -2.5); 

  endShape();
}
