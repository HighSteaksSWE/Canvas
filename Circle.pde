public class Circle extends Node {
  
  Point linePoint;
  int circumference, x, y;
  ArrayList<Point> points = new ArrayList<Point>();
  color circleColor;
  
  public Circle(int x, int y, int circumference, color c) {
    this.linePoint = new Point(x, y);    
    this.nodes.add(linePoint);
    this.circleColor = c;
    this.x = x;
    this.y = y;
    this.circumference = circumference;
    this.isActive = true;
  }
  
  public ArrayList<Point> getPoints(){
    return this.points;
  }
  
  public void display(CanvasModel model) {
    
    int dx = model.getScreenX((int) linePoint.getProperty("x"));
    int dy = model.getScreenY((int) linePoint.getProperty("y"));
    
    print(circleColor);
    stroke(circleColor);
    noFill();
    circle(dx, dy, circumference);
    
    super.display(model);
    
  }
  
  public void draw(CanvasModel model) {
    
    model.getCanvas().stroke(circleColor);
    model.getCanvas().noFill();
    model.getCanvas().circle((int) linePoint.getProperty("x"), (int) linePoint.getProperty("y"), circumference);
    
    super.draw(model);
    
  }
}
