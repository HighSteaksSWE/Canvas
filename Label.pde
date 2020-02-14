public class Label extends Text {
  public Label(String text, int x, int y, color c) {
    super(text, x, y, c);  
  }
  public void mousePressed(CanvasModel model) {
    if(mouseX < x + textWidth(text) && mouseX > x  && mouseY > y - 16  && mouseY < y) {
        if(isSelected() == false) {
          this.isSelected = true;  
        }
      } 
  }
  public void mouseDragged(CanvasModel model) {
  }
  public void draw(CanvasModel model) {
  }
  public void display(CanvasModel model) {
    fill(c);
    text(this.text, x, y);
  }
}
