CanvasController controller;
CanvasView view;
ColorPicker cp;
//Selected select = new Selected(false);

void setup() {
  
  size(1600, 900);
  view = new CanvasView();
  controller = new CanvasController();
  controller.getNodes().add(new Text(" Welcome to myPaint ! ", 450, 50, color(0,255,0)));
  //controller.getNodes().add(new Circle(100, 200, 50, color(0,255,0)));
  //controller.getNodes().add(new ToolPanel(0,0, controller));
  //controller.getNodes().add(new CreatorPanel(1300,600, "Line", poly.getPoints(), key));

 cp = new ColorPicker( 10, 10, 400, 400, 255 );


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
