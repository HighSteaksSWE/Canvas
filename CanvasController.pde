public class CanvasController {
  //changes model to be public
  private List<Node> nodes;
  public CanvasModel model;
  private FreeHandDrawing drawing;
  public Circle circle;
  public ColorPicker colorPicker;

  // hard coded text
  public Text text1;
  public Text text2;
  public Text text3;
  public Text text4;

  private Line newLine;
  ToolPanel panel;

  public CanvasController() {
    this.nodes = new ArrayList<Node>();
    this.model = new CanvasModel(1200, 500);
    this.drawing = new FreeHandDrawing(0, 0, 1200, 500);
    this.circle = new Circle(100, 200, 50, color(0, 255, 0));
    // hard coded text
    this.text1 = new Text("Circle", 150, 700, color(50, 255, 255));
    this.text2 = new Text("Polygon", 250, 700, color(255, 0, 0));
    this.text3 = new Text("Line", 355, 700, color(0, 255, 0));
    this.text4 = new Text("Rectangle", 460, 700, color(0, 0, 255));

    panel = new ToolPanel(1300, 250, this);
    //color picker
    this.colorPicker = new ColorPicker(1100, 600, 150, 150, color(0,250,250));
    nodes.add(colorPicker);
    colorPicker.render();
    
    
    nodes.add(panel);
    nodes.add(drawing);
    nodes.add(circle);

    // hard coded text
    nodes.add(text1);
    nodes.add(text2);
    nodes.add(text3);
    nodes.add(text4);
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
    colorPicker.render();
    for ( Node node : nodes) {
      node.draw(model);
    }
  }

  public void displayAllNodes() {
    // drawing action
    colorPicker.render();
    this.drawing.isActive = panel.freeDrawingButton.toggle;
    for ( Node node : nodes ) {
      node.display(model);
    }
  }

  public void handleMousePressed() {
    // Line action
    if (panel.lineButton.toggle && mousePressed) {
      newLine = new Line(model.getCanvasX(mouseX), model.getCanvasY(mouseY), model.getCanvasX( mouseX), model.getCanvasY(mouseY), color(128, 0, 0));
      this.nodes.add(newLine);
    }
    // Circle action
    if (panel.circleButton.toggle && mousePressed) {
      circle = new Circle(100, 200, 50, color(0, 255, 0));
      this.nodes.add(circle);
    }

    // text action
    if (panel.textButton.toggle && mousePressed) {
      this.text1 = new Text("Circle", 150, 700, color(255, 255, 0));
      this.text2 = new Text("Polygon", 250, 700, color(255, 0, 0));
      this.text3 = new Text("Line", 355, 700, color(0, 255, 0));
      this.text4 = new Text("Rectangle", 460, 700, color(0, 0, 255));

      this.nodes.add(text1);
      this.nodes.add(text2);
      this.nodes.add(text3);
      this.nodes.add(text4);
    }


    for (Node node : nodes) {
      if (node.isActive)
        node.mousePressed(model);
    }
  }

  public void handleMouseReleased() {
    // turn off line 
    if (panel.lineButton.toggle && !mousePressed) {
      newLine = null;
    }

    // turn off circle 
    if (panel.circleButton.toggle && !mousePressed) {
      circle = null;
    }

    // turn off text 
    if (panel.textButton.toggle && !mousePressed) {
      text1 = null;
      text2 = null;
      text3 = null;
      text4 = null;
    }

    for (Node node : nodes) {
      if (node.isActive)
        node.mouseReleased(model);
    }
  }

  public void handleMouseClicked() {
    for (Node node : nodes) {
      if (node.isActive)
        node.mousePressed(model);
    }
  }

  public void handleMouseDragged() {
    if (panel.lineButton.toggle && newLine != null) { 
      newLine.b.setX(model.getCanvasX(mouseX));
      newLine.b.setY(model.getCanvasY(mouseY));
    } else if (panel.panButton.toggle && mousePressed) {
      this.model.x += mouseX - pmouseX;
      this.model.y += mouseY - pmouseY;
    }
    for (Node node : nodes) {
      if (node.isActive)
        node.mouseDragged(model);
    }
  }

  public void handleMouseWheel() {
    for (Node node : nodes) {
      if (node.isActive)
        node.mouseWheel(model);
    }
  }
}  
