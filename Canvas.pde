CanvasController controller;
CanvasView view;

void setup() {
  
  size(600, 400);
  
  view = new CanvasView();
  controller = new CanvasController();

  controller.getNodes().add(new Point(50, 50));
  controller.getNodes().add(new Line(100, 100, 300, 100, color(0, 0, 255)));
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
