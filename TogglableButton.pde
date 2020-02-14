public class TogglableButton extends Button {
  boolean toggle = false;
  
  public TogglableButton(PImage image, int x, int y, int w, int h) {
    super(image, x, y, w, h);
    this.toggle = false;
  }
  
  public void mousePressed(CanvasModel model) {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      for(MouseEventHandler event : events) {
        event.mousePressed(model);
      }
    }
  }
  
  public void mouseReleased(CanvasModel model) {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if(toggle == true) {
        isSelected = false; toggle = false; 
      }
      else {
        isSelected = true; toggle = true; 
      }
      for(MouseEventHandler event : events) {
        event.mouseReleased(model);
      }
    }
    
  }
}
