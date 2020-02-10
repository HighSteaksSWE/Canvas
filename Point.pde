public class Point extends Node implements Editable {
  int dx, dy;
  int cx, cy;
  public Point(int x, int y) {
    this.cx = x;
    this.cy = y;
  }
  
  public void setProperty(String s, Object o) {
    if(s.equals("x")) {
      this.cx = (int) o;
    }
    if(s.equals("y")) {
      this.cy = (int) o;
    }
  }
  
  public Object getProperty(String s) {
    if(s.equals("x")) {
      return cx;
    }
    if(s.equals("y")) {
      return cy;
    }
    return null;
  }
  
  public void draw(CanvasModel model){
    //nothing to draw on model
    super.draw(model); // draw children if any exist
  }
  
  public void display(CanvasModel model) {
    dx = model.getScreenX(this.cx);
    dy = model.getScreenY(this.cy);
    
    stroke(255);
    noFill();
    circle(dx, dy, 10);
  }
  
  @Override
  public void mousePressed(CanvasModel model) {
      //println(mouseX + " , " + mouseY);
      if(Math.abs(dx - mouseX) < 10 && Math.abs(dy - mouseY) < 10) {
        if(isSelected() == false) {
          this.isSelected = true;  
        }
      }
  }
  @Override
  public void mouseDragged(CanvasModel model) {
    if(isSelected()) {
       this.cx = model.getCanvasX(mouseX);
       this.cy = model.getCanvasX(mouseY);
    }
  }
  @Override
  public void mouseReleased(CanvasModel model) {
    this.isSelected = false; 
  }
}
