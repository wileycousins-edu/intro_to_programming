void setup(){
  size(600,600,P3D);
}

void draw(){
  background(100);
  
  translate(0,0,0);
  noStroke();
  lights();
  sphere(20);
  
  noFill();
  stroke(0);
  
  translate(width/2, height/2, 200);
  rotateY(PI/5);
  rotateX(PI/9);
  box(10,20,20);
  
}
