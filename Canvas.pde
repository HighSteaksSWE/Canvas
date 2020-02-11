CanvasController controller;
CanvasView view;

void setup() {
  
  size(600, 400);
  
  view = new CanvasView();
  controller = new CanvasController();

  controller.getNodes().add(new Point(450, 50));
  controller.getNodes().add(new Line(500, 50, 500, 250, color(0, 0, 255)));
  controller.getNodes().add(new Button(loadImage("button.png"), 475, 150, 50, 50));
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
