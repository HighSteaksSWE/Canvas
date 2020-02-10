public class CanvasView {
  public void draw(CanvasController controller) {
    controller.startDrawModel();
    controller.drawAllNodes();
    controller.endDrawModel();
  }
  public void display(CanvasController controller) {
    controller.displayAllNodes();
  }
}
