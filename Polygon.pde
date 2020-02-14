public class Polygon extends Node {
  
  ArrayList<Point> points = new ArrayList<Point>();
  ArrayList<Line> lines = new ArrayList<Line>();
  color c;
  String type;
  private int pointsCurrent = 2;  private int linesCurrent = 2;
  Line lastLine;
  
  public Polygon(int x1, int y1, int x2, int y2, color c, String type) {
    this.points.add(new Point(x1, y1));
    this.points.add(new Point(x2, y2));    
    this.nodes.add(points.get(0));
    this.nodes.add(points.get(1));
    this.c = c;
    this.type = type;
    
    lines.add(new Line((int) points.get(0).getProperty("x"), (int) points.get(0).getProperty("y"), (int) points.get(1).getProperty("x"), (int) points.get(1).getProperty("y"), c));
    this.nodes.add(lines.get(0));
    
    lines.add(new Line((int) points.get(0).getProperty("x"), (int) points.get(0).getProperty("y"), (int) points.get(1).getProperty("x"), (int) points.get(1).getProperty("y"), c));
    this.nodes.add(lines.get(1));
    lastLine = lines.get(1);
  }
  
  public ArrayList<Point> getPoints(){
  
    ArrayList<Point> neededPoints = new ArrayList<Point>();
    
    neededPoints.add(this.points.get(0));
    
    for (int i = 1; i < this.points.size(); i++){
    
      neededPoints.add(this.points.get(i));
    
    }
    
    neededPoints.add(this.points.get(this.points.size() - 1));
    
    return neededPoints;
  
  }
 
  public void addPoint(int x, int y){
       
    pointsCurrent = pointsCurrent + 1;
    points.add(new Point(x, y));
    
    linesCurrent = linesCurrent + 1;
    lines.add(linesCurrent - 1, new Line((int) points.get(pointsCurrent - 2).getProperty("x"), (int) points.get(pointsCurrent - 2).getProperty("y"), (int) points.get(pointsCurrent - 1).getProperty("x"), (int) points.get(pointsCurrent - 1).getProperty("y"), c));
    
    this.nodes.add(lines.get(linesCurrent - 1));
    
    if (type == "closed"){
      this.lastLine.b.setProperty("x", this.points.get(pointsCurrent - 1).getProperty("x"));
      this.lastLine.b.setProperty("y", this.points.get(pointsCurrent - 1).getProperty("y"));
    }
  }
}
