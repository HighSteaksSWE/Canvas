CanvasController controller;
CanvasView view;

void setup() {
  
  size(600, 400);
  
  view = new CanvasView();
  controller = new CanvasController();

  controller.getNodes().add(new Point(450, 50));
  controller.getNodes().add(new Line(500, 50, 500, 250, color(0, 0, 255)));
  controller.getNodes().add(new Button(loadImage("button.png"), 475, 150, 50, 50));
  controller.getNodes().add(new Text("Hello World", 100, 100, color(0,255,0)));
  
  Polygon poly = new Polygon(50, 50, 100, 100, color(255,255,0), "type");
  poly.addPoint(50, 100);
  poly.addPoint(50, 50);
  
  controller.getNodes().add(poly);
  
  Panel panel = new Panel(loadImage("button.png"), 10, 20, 100, 200);
  
  controller.getNodes().add(panel);
  
}

void draw() {
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
