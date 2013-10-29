
class Triangles {

 Triangles () {
  

  
  
}

void display (){
  
   ambientLight(0, 0, 255);
  lights();
  scale (50);
  
  beginShape();

  fill(25, 98, 120, 100);
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
