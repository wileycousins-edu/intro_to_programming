public class WritingUtensil {
  color my_color;
  int body_height;
  int body_radius;
  int tip_height;
  int tip_radius;
  String name;
  PVector location;
  float neck_height;
  PVector orientation;
  Content content;

  public WritingUtensil() {
    my_color = color(200, 10, 10);
    body_height = 100;
    body_radius = 20;
    tip_height = 10;
    tip_radius = 1;
    name = "Default Utensil";
    location = new PVector(0, 0, 0);
    neck_height = 40;
    orientation = new PVector(0, 0, 0);
  }

  // returns the overall height of the writing utensil
  int height() {
    return 0;
  }

  // write puts pigment of contents on the screen
  // as of now it accepts no parameters
  void write() {
    // might be a good to handle this...
    // write(1.0);
    content.write(location.x, location.y, location.z);
  }

  // write puts pigment of contents on the screen
  // accepts one parameter, that is the pressure being applied to the utensil
  void write(float pressure_used) {
    // call deteriorationRate and pass to a content.deteriorate. e.g.
    // content.deteriorate(deteriorationRate());
  }

  // erase "removes" pigment from screen.
  // removes pigment by drawing the passed in background color
  // size of mark is going to be determined by the body radius
  // accepts one parameter, the color of the background
  void erase(color color_of_background) {
    // might be a good way to handle this...
    // erase(color_of_background, 1.0);
  }

  // erase removes pigment from screen, and distrorts the erase size based on pressure
  // accepts two parameter, the color of the background and the pressure applied
  void erase(color color_of_background, float pressure_used) {
  }

  // deteriorationRate calculates how quickly the contents get used up
  // returns a float representation of that. 
  float deteriorationRate(float pressure_used) {
    return 0.0;
  }

  float contentVolume() {
    return 0.0;
  }

  float updateContentsVolume() {
    return contentVolume();
  }

  // draws the writing utensil shell to the screen
  void render() {
    pushMatrix();
    noStroke();
    // move to where the utensil is
    translate(location.x, location.y-neck_height-tip_height, location.z);
    // rotate to the orientation vectors
    rotateX(orientation.x);
    rotateY(orientation.y);
    rotateZ(orientation.z);
    // set the fill color
    fill(my_color);
    // draw the body
    cylinder(body_radius, body_height, 20);
    // move the active drawing location to, the end of the body
    //    translate(0, 0, 0);
    // neck is green for now
    fill(0, 255, 0);
    // draw the neck
    cone(body_radius, neck_height);
    // set the tip to blue for now
    fill(0, 0, 255);
    // move to the tip
    translate(0, neck_height+tip_height, 0);
    // draw the tip
    cylinder(tip_radius, tip_height, 20);

    popMatrix();

    content.render();
  }

  // same as other render, but takes boolean arg to tell whether to display help text
  void render(boolean show_help_text) {
    render();
    showHelpText();
  }

  void showHelpText() {
    pushMatrix();
    fill(0);
    translate(location.x, location.y, location.z);
    String help_text = "location: "+ location.x+", " + location.y +", "+ location.z;
    text(help_text, 0, -100, 0);
    help_text = "orientation: "+ orientation.x+", " + orientation.y +", "+ orientation.z;
    text(help_text, 0, -80, 0);
    popMatrix();
  }

  // spins the utensil according to passed in radians
  void spin(PVector radians) {
    orientation.x += radians.x;
    orientation.y += radians.y;
    orientation.z += radians.z;
  }

  // set the content of the writing utensil to the passed in content
  // accepts one parameter, the content to set to
  void setContents(Content content_in) {
    content = content_in;
  }
}

/**
 cylinder taken from http://wiki.processing.org/index.php/Cylinder
 @author matt ditton
 */
// function to draw a cylinder
void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];

  //get the x and z position on a circle for all the sides
  for (int i=0; i < x.length; i++) {
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }

  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0, -h, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h, z[i]);
  }

  endShape();

  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h, z[i]);
    vertex(x[i], 0, z[i]);
  }

  endShape();

  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 

  vertex(0, 0, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], 0, z[i]);
  }

  endShape();
}


/**
 cone taken from http://wiki.processing.org/index.php/Cone
 @author Tom Carden
 */
static float unitConeX[];
static float unitConeY[];
static int coneDetail;

static {
  coneDetail(25);
}

// just inits the points of a circle, 
// if you're doing lots of cones the same size 
// then you'll want to cache height and radius too
static void coneDetail(int det) {
  coneDetail = det;
  unitConeX = new float[det+1];
  unitConeY = new float[det+1];
  for (int i = 0; i <= det; i++) {
    float a1 = TWO_PI * i / det;
    unitConeX[i] = (float)Math.cos(a1);
    unitConeY[i] = (float)Math.sin(a1);
  }
}

// places a cone with it's base centred at (x,y),
// beight h in positive z, radius r.
void cone(float r, float h) {
  pushMatrix();
  scale(r, 1, r);
  beginShape(TRIANGLES);
  for (int i = 0; i < coneDetail; i++) {
    vertex(unitConeX[i], 0, unitConeY[i]);
    vertex(unitConeX[i+1], 0, unitConeY[i+1]);
    vertex(0, h, 0);
  }
  endShape();
  popMatrix();
}

