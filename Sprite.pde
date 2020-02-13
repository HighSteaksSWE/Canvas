public class Sprite extends Node {
  PImage image;
  int w, h;
  color tint;
  
  public Sprite(PImage image, int x, int y, int w, int h, color tint) {
    this.image = image;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.tint = tint;
  }
  
  public Object getProperty(String string) {
    if(string.equals("x")) {
      return x; 
    }
    if(string.equals("y")) {
      return y; 
    }
    if(string.equals("w")) {
      return w; 
    }
    if(string.equals("h")) {
      return h; 
    }
    if(string.equals("image")) {
      return image; 
    }
    return null;
  }
  
  public void setProperty(String string, Object o) {
    if(string.equals("x")) {
      this.x = (int) o;
    }
    if(string.equals("y")) {
      this.y = (int) o;
    }
    if(string.equals("w")) {
      this.w = (int) o;
    }
    if(string.equals("h")) {
      this.h = (int) o;
    }
    if(string.equals("image")) {
      this.image = (PImage) o; 
    }
  }
  
  public Sprite(PImage image, int x, int y) {
    this(image, x, y, image.width, image.height, color(255)); 
  }
  
  public void draw(CanvasModel model) {
    //nothing to draw on the users canvas
  }
  
  public void display(CanvasModel model) {
    tint(tint);
    image(image, x, y, w, h);
    noTint();
  }
  
  public void mousePressed(CanvasModel model) {
    if(mousePressed && mouseX < x + w && mouseX > x && mouseY < y + h && mouseY > y) {
      isSelected = true;
    }
  }
  
  public void mouseReleased(CanvasModel model) {
    isSelected = false; 
  }
}
