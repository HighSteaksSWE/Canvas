import java.util.*;

public abstract class Node implements Displayable, Drawable, MouseEventHandler {
  protected List<Node> nodes;
  protected boolean isSelected;
  protected int x, y;
  protected boolean isActive;
  
  public Node() {
    this.nodes = new ArrayList<Node>();
    this.isSelected = false;
    this.x = 0;
    this.y = 0;
    this.isActive = false;
  }
  
  public int getX() {
    return x; 
  }
  
  public int getY() {
      return y;
  }
  
  public void setX(int x) {
    this.x = x;  
  }
  
  public void setY(int y) {
    this.y = y; 
  }
  
  public List<Node> getNodes() {
    return this.nodes;
  }
  
  public boolean isSelected() {
    return isSelected; 
  }
 
  public void draw(CanvasModel canvas) {
    for(Node node : nodes) {
      node.draw(canvas); 
    }
  }
  public void display(CanvasModel canvas) {
    for(Node node : nodes) {
      node.display(canvas); 
    }
  }
  
  public void mousePressed(CanvasModel model) {
    if(isActive)
    for(Node node : nodes) {
      node.mousePressed(model); 
    }
  }
  
  public void mouseReleased(CanvasModel model) {
    if(isActive)
    for(Node node : nodes) {
      node.mouseReleased(model); 
    }
  }
  
  public void mouseDragged(CanvasModel model) {
    if(isActive)
    for(Node node : nodes) {
      node.mouseDragged(model); 
    }
  }
  
  public void mouseClicked(CanvasModel model) {
    if(isActive)
    for(Node node : nodes) {
      node.mouseClicked(model); 
    }
  }
  
  public void mouseWheel(CanvasModel model) {
    if(isActive)
    for(Node node : nodes) {
      node.mouseWheel(model); 
    }
  }
}
