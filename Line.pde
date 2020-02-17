public class Line extends Node {
  
  Point a, b;
  ArrayList<Point> points = new ArrayList<Point>();
  int offset, x1, x2, y1, y2;
  color c;
  
  public Line(int x1, int y1, int x2, int y2, color c) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.a = new Point(x1, y1);
    this.b = new Point(x2, y2);
    this.nodes.add(a);
    this.isActive = true;
    this.nodes.add(b);
    this.c = c;
    this.points.add(this.a);
    this.points.add(this.b);
  }
  
  public ArrayList<Point> getPoints(){
    return this.points;
  }
  
  public int getX1(){
    return this.x1;
  }
  
  public int getX2(){
    return this.x2;
  }
  
  public int getY1(){
    return this.y1;
  }
  
  public int getY2(){
    return this.y2;
  }
  
  public void display(CanvasModel model) {
    int dx1 = model.getScreenX((int) a.getProperty("x"));
    int dy1 = model.getScreenY((int) a.getProperty("y"));
    int dx2 = model.getScreenX((int) b.getProperty("x"));
    int dy2 = model.getScreenY((int) b.getProperty("y"));
    
    stroke(c);
    line(dx1, dy1, dx2, dy2);
    super.display(model);
  }
  
  public void draw(CanvasModel model) {
    int x1 = (int) a.getX();
    int y1 = (int) a.getY();
    int x2 = (int) b.getX();
    int y2 = (int) b.getY();
    
    model.getCanvas().stroke(c);
    model.getCanvas().strokeWeight(5);
    model.getCanvas().line(x1, y1, x2, y2);
    
    super.draw(model);
  }
}
