public class Point extends Node implements Editable {
  int dx, dy;
  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void setProperty(String s, Object o) {
    if(s.equals("x")) {
      this.x = (int) o;
    }
    if(s.equals("y")) {
      this.y = (int) o;
    }
  }
  
  public Object getProperty(String s) {
    if(s.equals("x")) {
      return x;
    }
    if(s.equals("y")) {
      return y;
    }
    return null;
  }
  
  public void draw(CanvasModel model){
    //nothing to draw on model
    super.draw(model); // draw children if any exist
  }
  
  public void display(CanvasModel model) {
    dx = model.getScreenX(this.x);
    dy = model.getScreenY(this.y);
    
    stroke(0);
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
       this.x = model.getCanvasX(mouseX);
       this.y = model.getCanvasX(mouseY);
    }
  }
  @Override
  public void mouseReleased(CanvasModel model) {
    this.isSelected = false; 
  }
}
