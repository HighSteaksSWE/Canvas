public class CanvasModel {
  // changed first two member fields to public
  public PGraphics canvas;
  public int canvasWidth, canvasHeight, x, y;
  private float zoom;
  
  public CanvasModel() {
    this(400, 300);
  }
  
  public CanvasModel(int w, int h) {
    this.canvas =  createGraphics(w, h);
    this.canvasWidth = w;
    this.canvasHeight = h;
    this.x = 50;
    this.y = 50;
    this.zoom = 1.0;
  }
  
  public PGraphics getCanvas() {
    return this.canvas; 
  }
  
  public int getScreenX(int x) {
    return (int) (this.x + x * zoom);
  }
  
  public int getScreenY(int y) {
    return (int) (this.y + y * zoom);
  }
  
  public int getCanvasX(int x) {
    return (int) ((x - this.x) / zoom);
  }
  
  public int getCanvasY(int y) {
    return (int) ((y - this.y) / zoom);
  }
  
  public void draw() {
    image(canvas, x, y);
  }
}
