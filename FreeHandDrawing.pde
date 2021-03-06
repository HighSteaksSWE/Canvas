
public class FreeHandDrawing extends Node {
  PGraphics drawing;
  int w, h;
  color c;
  public FreeHandDrawing(int x, int y, int w, int h, color c) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.drawing = createGraphics(w,h);
      this.c = color(c);
  }
  
  public void draw(CanvasModel model) {
    model.getCanvas().image(drawing, x, y, w, h);
    super.draw(model);
  }
  
  public void display(CanvasModel model) {
     //stubbed
  }
  
  public void mousePressed(CanvasModel model) {
    if(mousePressed) isSelected = true;
  }
  
  public void mouseDragged(CanvasModel model) {
    if(isSelected()) {
      int sx = model.getScreenX(x);
      int sy = model.getScreenY(y);
      int sw = model.getScreenX(w);
      int sh = model.getScreenX(h);
      if(mouseX > sx && mouseX < sx + sw && mouseY > sy && mouseY < sy + sh) {
        int cx = model.getCanvasX(mouseX);
        int cy = model.getCanvasY(mouseY);
        int cpx = model.getCanvasX(pmouseX);
        int cpy = model.getCanvasY(pmouseY);
        drawing.beginDraw();
        drawing.stroke(c);
        drawing.line(cx, cy, cpx, cpy); 
        drawing.endDraw();
      } 
    }
  }
  
  public void setColor(color c) {
    this.c = c; 
  }
  
  public void mouseReleased(CanvasModel model) {
    isSelected = false; 
  }
  
}
