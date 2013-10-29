
float a = 0.0;
HScrollbar hs1;
Triangles tr1, tr2;


void setup()
{
  size(700, 700, P3D);
  smooth();
  hs1 = new HScrollbar(0, 650, width, 16, 16);
  tr1 = new Triangles () ;
}


void draw ()
{
  float rotation = hs1.getPos()-width/2;

  background(0);

 
  hs1.update();
  hs1.display();
  translate(width/2, height/2-50, 0); 
  rotateY(rotation);
  tr1.display ();

  translate(width/2, height/2-50, 0); 
  scale (20);
  rotateY(rotation);
  tr1.display ();
  
}

