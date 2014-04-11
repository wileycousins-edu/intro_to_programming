WritingUtensil my_utensil;

void setup(){
  size(600,600,P3D);
  frameRate(25);
  my_utensil = new WritingUtensil();
  my_utensil.my_color = color(100,200,255);
  my_utensil.location = new PVector(width/2,height/2,100);
  my_utensil.orientation = new PVector(PI/5,0,0);
  background(100);
}

void draw(){
  background(100);
  my_utensil.spin(new PVector(PI/100,0,PI/100));
  my_utensil.render(true);
}
