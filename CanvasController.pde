public class CanvasController {
  private List<Node> nodes;
  private CanvasModel model;
  
  public CanvasController() {
    this.nodes = new ArrayList<Node>();
    this.model = new CanvasModel();
  }
  
  public List<Node> getNodes() {
    return this.nodes; 
  }
  
  public void startDrawModel() {
    model.getCanvas().beginDraw();
  }
  
  public void endDrawModel() {
    model.getCanvas().endDraw();
    model.draw();
  }
  
  public void drawAllNodes() {
    for( Node node : nodes) {
      node.draw(model); 
    }
  }
  
  public void displayAllNodes() {
    for( Node node : nodes ) {
      node.display(model); 
    }
  }
  
  public void handleMousePressed() {
    for(Node node: nodes) {
      node.mousePressed(model); 
    }
  }
  
  public void handleMouseReleased() {
    for(Node node: nodes) {
      node.mouseReleased(model); 
    }
  }
  
  public void handleMouseClicked() {
    for(Node node: nodes) {
      node.mousePressed(model); 
    }
  }
  
  public void handleMouseDragged() {
    for(Node node: nodes) {
      node.mouseDragged(model); 
    }
  }
  
  public void handleMouseWheel() {
    for(Node node: nodes) {
      node.mouseWheel(model); 
    }
  }
}  
