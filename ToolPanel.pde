public class ToolPanel extends Panel {
  
  List<TogglableButton> buttons;
  
  public ToolPanel(int x, int y, CanvasController controller) {
    super(new Label("### TOOLS ###", x + 5, y + 20, color(0)), x, y, 100, 300);
    
    this.buttons = new ArrayList<TogglableButton>();
    
    // Line Button
    final TogglableButton lineButton = new TogglableButton(loadImage("line.png"), x + 10, y + 40, 28, 40);
    lineButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed line button");
        turnOffOtherButtons(lineButton);
      }
    });
    
    // shape Button
    final TogglableButton shapeButton = new TogglableButton(loadImage("star.png"), x + 55, y + 40, 28, 40);
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed shape button");
        turnOffOtherButtons(shapeButton);
      }
    });
    
    // freeDrawing Button
    final TogglableButton freeDrawing = new TogglableButton(loadImage("freeHand.png"), x + 10, y + 90, 28, 40);
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed freeDrawing button");
        turnOffOtherButtons(freeDrawing);
      }
    });
    
    // text Button
    final TogglableButton textButton = new TogglableButton(loadImage("text.png"), x + 55, y + 90, 28, 40);
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed text button");
        turnOffOtherButtons(textButton);
      }
    });

    // circle Button
    final TogglableButton circleButton = new TogglableButton(loadImage("circle.png"), x + 10, y + 140, 28, 40);
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed circle button");
        turnOffOtherButtons(circleButton);
      }
    });
    
    // copy object Button
    final TogglableButton copyButton = new TogglableButton(loadImage("copy.png"), x + 55, y + 140, 28, 40);
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed copy button");
        turnOffOtherButtons(copyButton);
      }
    });
    

    this.buttons.add(lineButton);
    this.buttons.add(shapeButton);
    this.buttons.add(freeDrawing);
    this.buttons.add(textButton);
    this.buttons.add(circleButton);
    this.buttons.add(copyButton);
    
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
