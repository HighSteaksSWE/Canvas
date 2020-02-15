public class CanvasController {
  //changes model to be public
  private List<Node> nodes;
  public CanvasModel model;
  private FreeHandDrawing drawing;
  private Line newLine;
  ToolPanel panel;
  
  public CanvasController() {
    this.nodes = new ArrayList<Node>();
    this.model = new CanvasModel();
    this.drawing = new FreeHandDrawing(0, 0, 400, 400);
    panel = new ToolPanel(0,0,this);
    nodes.add(panel);
    nodes.add(drawing);
  }
  
  public FreeHandDrawing getDrawing() {
    return drawing; 
  }
  
  public List<Node> getNodes() {
    return this.nodes; 
  }
  
  public void startDrawModel() {
    model.getCanvas().beginDraw();
    model.getCanvas().background(255);
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
    this.drawing.isActive = panel.freeDrawingButton.toggle;
    for( Node node : nodes ) {
      node.display(model); 
    }
  }
  
  public void handleMousePressed() {
    if(panel.lineButton.toggle && mousePressed) {
      newLine = new Line(model.getCanvasX(mouseX), model.getCanvasY(mouseY),model.getCanvasX( mouseX), model.getCanvasY(mouseY), color(128, 0, 0));
      this.nodes.add(newLine);
    }
    for(Node node: nodes) {
      if(node.isActive)
      node.mousePressed(model); 
    }
  }
  
  public void handleMouseReleased() {
    if(panel.lineButton.toggle && !mousePressed) {
      newLine = null;
    }
    for(Node node: nodes) {
      if(node.isActive)
      node.mouseReleased(model); 
    }
  }
  
  public void handleMouseClicked() {
    for(Node node: nodes) {
      if(node.isActive)
      node.mousePressed(model); 
    }
  }
  
  public void handleMouseDragged() {
    if(panel.lineButton.toggle && newLine != null) { 
      newLine.b.setX(model.getCanvasX(mouseX));
      newLine.b.setY(model.getCanvasY(mouseY));
    }
    for(Node node: nodes) {
      if(node.isActive)
      node.mouseDragged(model); 
    }
  }
  
  public void handleMouseWheel() {
    for(Node node: nodes) {
      if(node.isActive)
      node.mouseWheel(model); 
    }
  }
}  
