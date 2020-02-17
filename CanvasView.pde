public class CanvasView {
  public void draw(CanvasController controller) {
    background(128);
    controller.startDrawModel();
    controller.drawAllNodes();
    controller.endDrawModel();
  }
  public void display(CanvasController controller, Boolean displaySelected) {
    controller.displayAllNodes(displaySelected);
  }
}
