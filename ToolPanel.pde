public class ToolPanel extends Panel {
  
  List<TogglableButton> buttons;
  TogglableButton lineButton;
  TogglableButton shapeButton;
  TogglableButton freeDrawingButton;
  TogglableButton textButton;
  TogglableButton circleButton;
  TogglableButton selectButton;
  TogglableButton panButton;
  TogglableButton rectangleButton;
  
  
  
  public ToolPanel(int x, int y, CanvasController controller) {
    super(new Label(" Tools ", x + 5, y + 30, color(0)), x, y, 100, 300);
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
    
    // selct object Button
    selectButton = new TogglableButton(loadImage("select.png"), x + 55, y + 140, 28, 40);
    selectButton.isActive = true;
    selectButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed copy button");
        turnOffOtherButtons(selectButton);
      }
    });
    
    //pan button
    panButton = new TogglableButton(loadImage("pan.png"), x + 10, y + 190, 28, 40 );
    panButton.isActive = true;
    panButton.addEvent(new BottonEvent() {
      public void mouseReleased(CanvasModel model) {
        println("pressed copy button");
        turnOffOtherButtons(panButton);
      }
    });

    //Rectangle button
    rectangleButton = new TogglableButton(loadImage("rectangle.png"), x + 55, y + 190, 28, 40 );
    rectangleButton.isActive = true;
    rectangleButton.addEvent(new BottonEvent() {
      public void mouseReleased(CanvasModel model) {
        println("pressed Rectangle button");
        turnOffOtherButtons(panButton);
      }
    });
// Save panel
  SavePanel savePanel  = new SavePanel(controller.model);
  savePanel.addSaveButton();
  

    this.buttons.add(lineButton);
    this.buttons.add(shapeButton);
    this.buttons.add(freeDrawingButton);
    this.buttons.add(textButton);
    this.buttons.add(circleButton);
    this.buttons.add(selectButton);
    this.buttons.add(panButton);
    this.buttons.add(rectangleButton);
    this.buttons.add(savePanel.save);
    
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
