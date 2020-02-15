public class ToolPanel extends Panel {
  
  List<TogglableButton> buttons;
  TogglableButton lineButton;
  TogglableButton shapeButton;
  TogglableButton freeDrawingButton;
  TogglableButton textButton;
  TogglableButton circleButton;
  TogglableButton copyButton;
  
  public ToolPanel(int x, int y, CanvasController controller) {
    super(new Label("### TOOLS ###", x + 5, y + 20, color(0)), x, y, 100, 300);
    this.isActive = true;
    this.buttons = new ArrayList<TogglableButton>();
    
    
    // Line Button
    lineButton = new TogglableButton(loadImage("line.png"), x + 10, y + 40, 28, 40);
    lineButton.isActive = true;
    lineButton.addEvent(new BottonEvent(){
       public void mouseReleased(CanvasModel model) {
        println("pressed line button");
        turnOffOtherButtons(lineButton);
      }
    });
    
    // shape Button
    shapeButton = new TogglableButton(loadImage("star.png"), x + 55, y + 40, 28, 40);
    shapeButton.isActive = true;
    shapeButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model){ 
        println("pressed shape button");
        turnOffOtherButtons(shapeButton);
      }
    });
    final FreeHandDrawing drawing = controller.getDrawing();

    // freeDrawing Button
    freeDrawingButton = new TogglableButton(loadImage("freeHand.png"), x + 10, y + 90, 28, 40);
    freeDrawingButton.isActive = true;
    freeDrawingButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed freeDrawing button");
        turnOffOtherButtons(freeDrawingButton);
      }
    });
    
    // text Button
    textButton = new TogglableButton(loadImage("text.png"), x + 55, y + 90, 28, 40);
    textButton.isActive = true;
    textButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed text button");
        turnOffOtherButtons(textButton);
      }
    });

    // circle Button
    circleButton = new TogglableButton(loadImage("circle.png"), x + 10, y + 140, 28, 40);
    circleButton.isActive = true;
    circleButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed circle button");
        turnOffOtherButtons(circleButton);
      }
    });
    
    // copy object Button
    copyButton = new TogglableButton(loadImage("copy.png"), x + 55, y + 140, 28, 40);
    copyButton.isActive = true;
    copyButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed copy button");
        turnOffOtherButtons(copyButton);
      }
    });
    

    this.buttons.add(lineButton);
    this.buttons.add(shapeButton);
    this.buttons.add(freeDrawingButton);
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
      }
    }
  }
}
