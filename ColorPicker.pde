public class ColorPicker extends Panel {
  color fill, stroke;
  
  public ColorPicker(int x, int y) {
    super(new Label("Color Picker", x + 5, y + 20, color(0)), x, y, 50, 25);
    colorMode(HSB, 360, 100, 100);
    fill = color(0, 0, 100);
    stroke = color(0, 0, 0);
  }
}
