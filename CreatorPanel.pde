public class CreatorPanel extends Panel {
  
  List<TogglableButton> buttons;
  int x, y, xLabel, yLabel, currentPoint;
  ArrayList<Point> points = new ArrayList<Point>();
  
  public CreatorPanel(int x, int y, String type, ArrayList points) {
    super(new Label("         " + type, x + 10, y + 20, color(0)), x, y, 100, 100);
    //super(new Text("Hello World", 100, 100, color(0,255,0)));
    
    this.x = x;
    this.y = y;
    this.points = points;
    this.buttons = new ArrayList<TogglableButton>();
    this.currentPoint = 0;
    this.xLabel = (int) this.points.get(this.currentPoint).getProperty("x");
    this.yLabel = (int) this.points.get(this.currentPoint).getProperty("y");
    
    final TogglableButton xButton = new TogglableButton(loadImage("button.png"), x + 75, y + 35, 25, 25);
    xButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed x button");
        turnOffOtherButtons(xButton);
        
      }
    });
    
    final TogglableButton yButton = new TogglableButton(loadImage("button.png"), x + 75, y + 55, 25, 25);
    yButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed y button");
        turnOffOtherButtons(yButton);
        
      }
    });
    
    final TogglableButton pointButton = new TogglableButton(loadImage("button.png"), x + 25, y + 75, 50, 25);
    pointButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed y button");
        turnOffOtherButtons(pointButton);
        
      }
    });
    
    this.buttons.add(yButton);
    this.buttons.add(xButton);
    this.buttons.add(pointButton);
    
    this.getNodes().addAll(buttons);
  }
  
  private void turnOffOtherButtons(TogglableButton recentlyPressedButton) {
    for(TogglableButton button : buttons) {
      if(button != recentlyPressedButton) {
        button.toggle = false;
        button.isSelected = false;
        println("changed");
      }
    }
  }
}
