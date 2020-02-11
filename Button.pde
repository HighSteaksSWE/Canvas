public class Button extends Node {
  PImage img;
  int x, y, w, h;
  List<MouseEventHandler> events;
  
  public Button(PImage img, int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.img = img;
    this.events = new ArrayList<MouseEventHandler>();
  }
  
  public void addEvent(MouseEventHandler event) {
    this.events.add(event);
  }
  
  public void display(CanvasModel model) {
    if(isSelected()) tint(200); else tint(255);
    image(this.img, x, y, w, h);
    noTint();
  }
  
  public void mousePressed(CanvasModel model) {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if(mousePressed) isSelected = true; 
      for(MouseEventHandler event : events) {
        event.mousePressed(model);
      }
    }
  }
  
  public void mouseReleased(CanvasModel model) {
    isSelected = false;
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      for(MouseEventHandler event : events) {
        event.mouseReleased(model);
      }
    }
  }
  
  public void mouseClicked(CanvasModel model) {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      for(MouseEventHandler event : events) {
        event.mouseClicked(model);
      }
    }
  }
  
  public void mouseWheel(CanvasModel model) {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      for(MouseEventHandler event : events) {
        event.mouseWheel(model);
      }
    }
  }
  
  public void mouseDragged(CanvasModel model) {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      for(MouseEventHandler event : events) {
        event.mouseDragged(model);
      }
    }
  }
}
