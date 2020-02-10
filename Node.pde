import java.util.*;

public abstract class Node implements Displayable, Drawable, MouseEventHandler {
  protected List<Node> nodes;
  protected boolean isSelected;
  
  public Node() {
    this.nodes = new ArrayList<Node>();
    this.isSelected = false;
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
    for(Node node : nodes) {
      node.mousePressed(model); 
    }
  }
  
  public void mouseReleased(CanvasModel model) {
    for(Node node : nodes) {
      node.mouseReleased(model); 
    }
  }
  
  public void mouseDragged(CanvasModel model) {
    for(Node node : nodes) {
      node.mouseDragged(model); 
    }
  }
  
  public void mouseClicked(CanvasModel model) {
    for(Node node : nodes) {
      node.mouseClicked(model); 
    }
  }
  
  public void mouseWheel(CanvasModel model) {
    for(Node node : nodes) {
      node.mouseWheel(model); 
    }
  }
}
