public class Group extends Node {
  
  public int width, height;
  
  public void addNode(Node node) {
    this.nodes.add(node);
  }
  
  public void mousePressed(CanvasModel model) {
    if(isSelected() == false && mousePressed) {
      isSelected = true;  
    }
    super.mousePressed(model);
  }
  
  public void mouseDragged(CanvasModel model) {
    if(isSelected()) {
      this.x += mouseX - pmouseX; 
      this.y += mouseY - pmouseY;
      for(Node node : nodes) {
        node.x += mouseX - pmouseX; 
        node.y += mouseY - pmouseY;
      }
    }
    super.mouseDragged(model);
  }
  
  public void mouseReleased(CanvasModel model) {
    isSelected = false;  
    super.mouseReleased(model);
  }
}
