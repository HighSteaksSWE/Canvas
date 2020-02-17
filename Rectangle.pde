
public class Rectangle extends Node{
  
  Point main;
  int x;
  int y;
  int w;
  int h;
  int dx;
  int dy;
  
  public Rectangle(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.main = new Point(x, y);
    this.nodes.add(this.main);
    this.isActive = true;
  }
  
  public void setX(int newX){
    this.x = newX;
  }
  
  public void setY(int newY){
    this.y = newY;
  }
  
  public void display(CanvasModel model) {
    
     dx = model.getScreenX(this.x);
     dy = model.getScreenY(this.y);
    
     noFill();
     rect(dx, dy, w, h);    
     super.display(model);
    
  }
  
  public void draw(CanvasModel model) {
    noFill();
    model.getCanvas().rect(this.x, this.y, w, h);
   
    super.draw(model);    
  }
 

  
 
}
