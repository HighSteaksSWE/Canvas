public class ColorSlider extends Node {
  protected int w = 100, h = 25;
  
  List<MouseEventHandler> events;
  
  public ColorSlider(int hsb, int x, int y) {
    this.x = x;
    this.y = y;
    this.events = new ArrayList<MouseEventHandler>();
  }
}
