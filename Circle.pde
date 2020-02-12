public class Circle extends Node {
  
  Point linePoint;
  int circumference, x, y;
  color c;
  
  public Circle(int x, int y, int circumference, color c) {
    this.linePoint = new Point(x, y);    
    this.nodes.add(linePoint);
    this.c = c;
    this.x = x;
    this.y = y;
    this.circumference = circumference;
  }
  
  public void display(CanvasModel model) {
    
    int dx = model.getScreenX((int) linePoint.getProperty("x"));
    int dy = model.getScreenY((int) linePoint.getProperty("y"));
    
    stroke(c);
    circle(dx, dy, circumference);
    
    super.display(model);
    
  }
  
  public void draw(CanvasModel model) {
    
    stroke(c);
    model.getCanvas().circle((int) linePoint.getProperty("x"), (int) linePoint.getProperty("y"), circumference);
    
    super.draw(model);
    
  }
}
