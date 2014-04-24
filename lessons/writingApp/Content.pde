public class Content {

  color my_color;
  ArrayList<PVector> trail;

  public Content() {
    my_color = color(140, 30, 80);
    trail = new ArrayList<PVector>();
  }

  public write(int x, int y, int z) {
    trail.push(new PVector(x, y, z));
  }

  public draw() {
    fill(my_color);
    beginShape(LINE);
    for (PVector point : trail) {
      vertex(point.x, point.y, point.x);
    }
    endShape();
  }
}

