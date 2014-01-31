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
