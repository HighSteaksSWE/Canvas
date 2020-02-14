public class ToolPanel extends Panel {
  
  List<TogglableButton> buttons;
  
  public ToolPanel(int x, int y, CanvasController controller) {
    super(new Label("===TOOLS===", x + 10, y + 20, color(0)), x, y, 100, 300);
    
    this.buttons = new ArrayList<TogglableButton>();
    
    final TogglableButton lineButton = new TogglableButton(loadImage("button.png"), x + 10, y + 40, 28, 40);
    lineButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed line button");
        turnOffOtherButtons(lineButton);
      }
    });
    
    final TogglableButton shapeButton = new TogglableButton(loadImage("button.png"), x + 45, y + 40, 28, 40);
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed shape button");
        turnOffOtherButtons(shapeButton);
      }
    });
    
    
    this.buttons.add(lineButton);
    this.buttons.add(shapeButton);
    
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
