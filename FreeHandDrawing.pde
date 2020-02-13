
public class FreeHandDrawing extends Node implements Editable {

  HashMap<String, Node> properties = new HashMap<String, Node>();
  int  dx, dy, dpx, dpy;


  public FreeHandDrawing() {
  }


  public Object getProperty(String s) {

    if (s.equals("x")) {
      return mouseX;
    }
    if (s.equals("y")) {
      return mouseY;
    }
    return null;
  }
  public void setProperty(String s, Object object) {
  }

  public void display(CanvasModel model) {
    this.dx = model.getCanvasX((int) mouseX);
    this.dy =  model.getCanvasY((int) mouseY);
    this.dpx = model.getCanvasX((int) pmouseX);
    this.dpy =  model.getCanvasY((int) pmouseY);
    model.getCanvas().stroke(255);
    if (mousePressed == true) {
      model.getCanvas().line(mouseX, mouseY, pmouseX, pmouseY);
    }

    
    
    super.display(model);
    
  }

  public void draw(CanvasModel model) {
    stroke(0);
    if (mousePressed == true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    
    super.draw(model);
  }

  @Override
    public void mousePressed(CanvasModel model) {

    if (isSelected() == false) {
      this.isSelected = true;
      cursor(HAND);
      super.display(model);
    }
  }
  @Override
    public void mouseDragged(CanvasModel model) {
    if (isSelected()) {
      cursor(HAND);
      
      
    }
  }
  @Override
    public void mouseReleased(CanvasModel model) {
    this.isSelected = false;
    cursor(ARROW);
  }
}
