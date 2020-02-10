public class Line extends Node {
  
  private Point a, b;
  color c;
  
  public Line(int x1, int y1, int x2, int y2, color c) {
    this.a = new Point(x1, y1);
    this.b = new Point(x2, y2);
    this.nodes.add(a);
    this.nodes.add(b);
    this.c = c;
  }
  
  public void display(CanvasModel model) {
    int dx1 = model.getScreenX((int) a.getProperty("x"));
    int dy1 = model.getScreenX((int) a.getProperty("y"));
    int dx2 = model.getScreenX((int) b.getProperty("x"));
    int dy2 = model.getScreenX((int) b.getProperty("y"));
    
    stroke(c);
    line(dx1, dy1, dx2, dy2);
    super.display(model);
  }
  
  public void draw(CanvasModel model) {
    int x1 = (int) a.getProperty("x");
    int y1 = (int) a.getProperty("y");
    int x2 = (int) b.getProperty("x");
    int y2 = (int) b.getProperty("y");
    
    model.getCanvas().stroke(255, 0, 0);
    model.getCanvas().strokeWeight(5);
    model.getCanvas().line(x1, y1, x2, y2);
    super.draw(model);
  }
}
