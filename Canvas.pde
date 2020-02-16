CanvasController controller;
CanvasView view;

void setup() {
  
  size(1600, 900);
  
  view = new CanvasView();
  controller = new CanvasController();
  
  controller.getNodes().add(new Text(" Welcom to myPaint ! ", 450, 50, color(0,255,0)));
  //controller.getNodes().add(new Circle(100, 200, 50, color(0,255,0)));
  
  
  Polygon poly = new Polygon(50, 50, 100, 100, color(255,255,0), "type");
  poly.addPoint(50, 100);
  poly.addPoint(50, 50);
  
  controller.getNodes().add(poly);
  //controller.getNodes().add(new ToolPanel(0,0, controller));
  //controller.getNodes().add(new CreatorPanel(1300,600, "Line", poly.getPoints(), key));
  
 
  
}

void draw() {
  keyReleased();
  
  view.draw(controller);
  view.display(controller);
}

void mousePressed() {
  controller.handleMousePressed();  
}

void mouseReleased() {
  controller.handleMouseReleased();
}

void mouseClicked() {
  controller.handleMouseClicked(); 
}

void mouseDragged() {
  controller.handleMouseDragged(); 
}

void mouseWheel() {
  controller.handleMouseWheel(); 
}
