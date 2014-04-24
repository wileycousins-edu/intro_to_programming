WritingUtensil my_utensil;

boolean follow_mouse = false;
boolean rotate_mouse = false;

void setup() {
  size(600, 600, P3D);
  frameRate(25);
  my_utensil = new WritingUtensil();
  my_utensil.my_color = color(200, 200, 255);
  my_utensil.location = new PVector(width/2, height/2, 100);
  my_utensil.orientation = new PVector(PI/5, 0, 0);
  
  my_utensil.setContents(new Content());
  
  background(100);
}

void draw() {
  background(100);
  pushMatrix();
  fill(225,20,20);
  text("press SHIFT to toggle mouse follow", 10, 10);
  text("press ALT to toggle mouse rotate", 10, 30);
  popMatrix();
  //  my_utensil.spin(new PVector(PI/50,0,PI/100));
  if ( follow_mouse )
    my_utensil.location = new PVector(mouseX, mouseY, 100);
  if ( rotate_mouse ){
    my_utensil.orientation.x = map(mouseX, 0, width, -PI/2, PI/2);
    my_utensil.orientation.z = map(mouseY, 0, height, -PI/2, PI/2);
  }
  my_utensil.render(true);
  
  if ( mousePressed ) {
    my_utensil.write();
  }
}

void keyPressed() {
  if (keyCode == SHIFT ) {
    follow_mouse = !follow_mouse;
  }
  else if (keyCode == ALT ) {
    rotate_mouse = !rotate_mouse;
  }
}

