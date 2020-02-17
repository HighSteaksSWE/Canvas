
public class Rectangle extends Node{
  
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
    
  }
  
  public void display(CanvasModel model) {
    
     dx = model.getScreenX((int) x);
     dy = model.getScreenY((int) y);
    
    noFill();
    rect(dx, dy, w, h);    
    super.display(model);
    
  }
  
  public void draw(CanvasModel model) {
    noFill();
    model.getCanvas().rect( x, y, w, h);
   
    super.draw(model);    
  }
 

  @Override
    public void mousePressed(CanvasModel model) {
    if (mouseX < dx + w && mouseX > dx  && mouseY > dy - h  && mouseY < dy) {
      if (isSelected() == false) {
        this.isSelected = true;
      }
    }
  }
  @Override
    public void mouseDragged(CanvasModel model) {
    if (isSelected()) {
      x = model.getCanvasX(mouseX);
      y = model.getCanvasX(mouseY);
    }
  }
  @Override
    public void mouseReleased(CanvasModel model) {
    this.isSelected = false;
  }
 
}
