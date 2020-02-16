public class ColorPanel extends Panel {
  color fill, stroke;
  
  
  public ColorPanel(int x, int y) {
    super(new Label("Color Picker", x + 20, y + 25, color(0)), x, y, 200, 250);
    colorMode(HSB, 100, 100, 100); // change Hue to 360 if there is time to make a wheel
    fill = color(0, 0, 100);
    stroke = color(0, 0, 0);
  }
  
  public color fill() {
    return fill;
  }
  
  public color stroke() {
    return stroke;
  }
  
  /* TODO: 
   * draw 3 rectangular 25h by 100w sliders representing hue, saturation, brightness
   * be able to pick a color from those sliders
   */
  
  // everything below is stubbed
  void pickHue() {
    // hue =
    // newColor = color(hue, fill.saturation(), fill.brightness());
  }
  
  void pickSaturation(){}
  void pickBrightness(){}
}
