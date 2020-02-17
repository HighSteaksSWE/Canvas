
public class Rectangle extends Node{
  
  Point main;
  int x;
  int y;
  int w;
  int h;
  int dx;
  int dy;
  color c;
  
  public Rectangle(int x, int y, int w, int h, color c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
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
     stroke(c);
     rect(dx, dy, w, h);    
     super.display(model);
    
  }
  
  public void draw(CanvasModel model) {
    model.getCanvas().noFill();
    model.getCanvas().stroke(c);
    model.getCanvas().rect(this.x, this.y, w, h);
   
    super.draw(model);    
  }
 

  
 
}
