import java.util.Map;

//draw text on the screen, and have it
// move
//scale
//rotate
//change color

public class Text extends Node implements Editable {

  HashMap<String, Node> properties = new HashMap<String, Node>();
  PFont f;
  int dx, dy;
  String text;
  color c;

  public Text(String string, int x, int y, color c) {
    f = createFont("Arial",16,true);
    this.isActive = true;
    this.x = x;
    this.y = y;
    this.text = string;
    this.c =c ;
  }

  public void setProperty(String s, Object o) {
    if(s.equals("x")) {
      this.x = (int) o;
    }
    if(s.equals("y")) {
      this.y = (int) o;
    }
    
    if (s.equals("text")){
      this.text = (String)o;
    }
    
  }

  public Object getProperty(String s) {
    if (s.equals("x")) {
      return x;
    }
    if (s.equals("y")) {
      return y;
    }
    if (s.equals("text")) {
      return text;
    }
    
    return null;
  }


  public void display(CanvasModel model) {
     this.dx = model.getScreenX((int) this.getProperty("x"));
     this.dy = model.getScreenY((int) this.getProperty("y"));

    fill(c);
    text(this.text, dx, dy);
    noFill();
    super.display(model);
  }

  public void draw(CanvasModel model) {
    int xLocation = (int) this.getProperty("x");
    int yLocation = (int) this.getProperty("y");

    model.getCanvas().text(this.text, xLocation, yLocation);
    super.draw(model);
  }

  @Override
  public void mousePressed(CanvasModel model) {
      if(mouseX < dx + textWidth(text) && mouseX > dx  && mouseY > dy - 16  && mouseY < dy) {
        if(isSelected() == false) {
          this.isSelected = true;  
        }
      }
  }
  @Override
  public void mouseDragged(CanvasModel model) {
    if(isSelected()) {
       x = model.getCanvasX(mouseX);
       y = model.getCanvasX(mouseY);
    }
  }
  @Override
  public void mouseReleased(CanvasModel model) {
    this.isSelected = false; 
  }

}
