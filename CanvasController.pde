public class CanvasController {
  //changes model to be public
  private List<Node> nodes;
  public CanvasModel model;
  private FreeHandDrawing drawing;
  public Circle circle;
  public ColorPanel colorPickerPanel;
  public ColorPicker colorPicker;
  public Rectangle rectangle;
  public Boolean selected = false;

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
    this.drawing = new FreeHandDrawing(0, 0, 1200, 500, color(0,250,250));
    this.rectangle = new Rectangle(100, 100, 200, 100, color(0, 255, 0));
    // hard coded text
    this.text1 = new Text("Circle", 150, 700, color(50, 255, 255));
    this.text2 = new Text("Polygon", 250, 700, color(255, 0, 0));
    this.text3 = new Text("Line", 355, 700, color(0, 255, 0));
    this.text4 = new Text("Rectangle", 460, 700, color(0, 0, 255));

    panel = new ToolPanel(1300, 250, this);
    //color picker
    
    this.colorPicker = new ColorPicker(1100, 600, 150, 150, color(0,250,250));
    this.colorPickerPanel = new ColorPanel(1080, 550);
    colorPickerPanel.getNodes().add(colorPicker);
    colorPickerPanel.isActive = true;
    nodes.add(colorPickerPanel);
    
    
    nodes.add(panel);
    nodes.add(rectangle);
    nodes.add(drawing);

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
    model.getCanvas().strokeWeight(5);
    model.getCanvas().background(255);
  }

  public void endDrawModel() {
    model.getCanvas().endDraw();
    model.draw();
  }

  public void drawAllNodes() {
    for ( Node node : nodes) {
      node.draw(model);
    }
  }

  public void displayAllNodes() {
    // drawing action
    this.drawing.isActive = panel.freeDrawingButton.toggle;
    this.drawing.setColor(colorPicker.getColor());
    if (selected){
      for ( Node node : nodes ) {
        if (node instanceof Panel){
          node.display(model);
        }
        if (node instanceof Button){
          node.display(model);
        }
        if (node instanceof Text){
          node.display(model);
        }
        if (node instanceof Sprite){
          node.display(model);
        }
        if (node instanceof Rectangle){
          ((Rectangle) node).setX((int) ((Point) node.getNodes().get(0)).getProperty("x"));
          ((Rectangle) node).setY((int) ((Point) node.getNodes().get(0)).getProperty("y"));
          ((Point) node.getNodes().get(0)).display(model);
        }
        if (node instanceof Polygon){
          
          int x2 = (int) ((Point) node.getNodes().get(1)).getProperty("x");
          int y2 = (int) ((Point) node.getNodes().get(1)).getProperty("y");
          int x1 = (int) ((Point) node.getNodes().get(0)).getProperty("x");
          int y1 = (int) ((Point) node.getNodes().get(0)).getProperty("y");
          
          ((Point) node.getNodes().get(1)).setProperty("x", (int) ((Point) node.getNodes().get(0)).getProperty("x") + (x2 - x1));
          ((Point) node.getNodes().get(1)).setProperty("y", (int) ((Point) node.getNodes().get(0)).getProperty("y") + (y2 - y1));
          
          ((Point) node.getNodes().get(2).getNodes().get(0)).setProperty("x", (int) ((Point) node.getNodes().get(0)).getProperty("x"));
          ((Point) node.getNodes().get(2).getNodes().get(0)).setProperty("y", (int) ((Point) node.getNodes().get(0)).getProperty("x"));
          
          for (int i = 2; i < node.getNodes().size(); i++){
            ((Point) node.getNodes().get(i).getNodes().get(1)).setProperty("x", (int) ((Point) node.getNodes().get(i).getNodes().get(0)).getProperty("x") + ((int)((Line) node.getNodes().get(i)).getX2() - (int)((Line) node.getNodes().get(i)).getX1()));
            ((Point) node.getNodes().get(i).getNodes().get(1)).setProperty("y", (int) ((Point) node.getNodes().get(i).getNodes().get(0)).getProperty("y") + ((int)((Line) node.getNodes().get(i)).getY2() - (int)((Line) node.getNodes().get(i)).getY1()));
          }
          node.getNodes().get(3).getNodes().get(0).display(model);
          node.getNodes().get(2).getNodes().get(0).display(model);
        }
        if (node instanceof Line){
          ((Point) node.getNodes().get(1)).setProperty("x", (int) ((Point)node.getNodes().get(0)).getProperty("x") + ((int)((Line) node).getX2() - (int)((Line) node).getX1()));
          ((Point) node.getNodes().get(1)).setProperty("y", (int) ((Point)node.getNodes().get(0)).getProperty("y") + ((int)((Line) node).getY2() - (int)((Line) node).getY1()));
          node.getNodes().get(0).display(model);
        }
        if (node instanceof Circle){
          node.getNodes().get(0).display(model);
        }
      }
    }
    else{
      for (Node node : nodes) {
        if (node instanceof Polygon){
          node.display(model);
        }
        if (node instanceof Rectangle){
          //node.display(model);
        }
        if (node instanceof Sprite){
          node.display(model);
        }
        if (node instanceof Panel){
          node.display(model);
        }
        if (node instanceof Button){
          node.display(model);
        }
        if (node instanceof Text){
          node.display(model);
        }
      }
    }
  }

  public void handleMousePressed() {
    // Line action
    if (panel.lineButton.toggle && mousePressed) {
      newLine = new Line(model.getCanvasX(mouseX), model.getCanvasY(mouseY), model.getCanvasX( mouseX), model.getCanvasY(mouseY), colorPicker.getColor());
      this.nodes.add(newLine);
    }
    // Circle action
    if (panel.circleButton.toggle && mousePressed) {
      circle = new Circle(model.getCanvasX(mouseX), model.getCanvasY(mouseY), 50, colorPicker.getColor());
      this.nodes.add(circle);
    }

    // Rectangle action
    if (panel.rectangleButton.toggle && mousePressed) {
      rectangle = new Rectangle(model.getCanvasX(mouseX), model.getCanvasY(mouseY), 100, 70, colorPicker.getColor());
      this.nodes.add(rectangle);
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
    
    // turn off Rectangle 
    if (panel.rectangleButton.toggle && !mousePressed) {
      rectangle = null;
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
