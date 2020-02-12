public class Sprite extends Node {
  PImage image;
  int w, h, x ,y;
  color tint;
  
  public Sprite(PImage image, int x, int y, int w, int h, color tint) {
    this.image = image;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.tint = tint;
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
