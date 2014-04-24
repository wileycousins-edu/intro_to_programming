public class Content {

  color my_color;
  ArrayList<PVector> trail;

  public Content() {
    my_color = color(140, 30, 80);
    trail = new ArrayList<PVector>();
  }

  void write(float x, float y, float z) {
    trail.add(new PVector(x, y, z));
  }

  void render() {
    stroke(my_color);
    noFill();
    beginShape();
    for (PVector point : trail) {
//      pushMatrix();
//      translate();
      curveVertex(point.x, point.y, point.z);
      println(point);
//      popMatrix();
    }
    endShape();
  }
}

