public class CreatorPanel extends Panel {
  
  List<TogglableButton> buttons;
  Point currentSelectedPoint;
  int x, y, xLabel, yLabel, currentPoint;
  String newX, newY, newCurrentPoint;
  Character theKey;
  ArrayList<Point> points = new ArrayList<Point>();
  
  public CreatorPanel(int x, int y, String type, ArrayList points, Character theKey) {
    super(new Label("         " + type, x + 10, y + 20, color(0)), x, y, 100, 100);
    //super(new Text("Hello World", 100, 100, color(0,255,0)));
    
    this.x = x;
    this.y = y;
    this.points = points;
    this.buttons = new ArrayList<TogglableButton>();
    
    this.currentPoint = 0;
    this.xLabel = (int) this.points.get(this.currentPoint).getProperty("x");
    this.yLabel = (int) this.points.get(this.currentPoint).getProperty("y");
    this.currentSelectedPoint = this.points.get(this.currentPoint);
    
    this.newX = str(this.xLabel);
    this.newY = str(this.yLabel);
    this.newCurrentPoint = str(this.currentPoint);
    
    textSize(10);
    
    Text xCoords = new Text(str(xLabel), 85, 57, color(0,255,0));
    Text currentlySelectedPoint = new Text(str(currentPoint), 85, 37, color(0,255,0));
    Text yCoords = new Text(str(yLabel), 85, 77, color(0,255,0));
    
    this.nodes.add(xCoords);
    this.nodes.add(yCoords);
    this.nodes.add(currentlySelectedPoint);
    
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
    
    final TogglableButton currentlySelectedPointButton = new TogglableButton(loadImage("button.png"), x + 75, y + 15, 25, 25);
    currentlySelectedPointButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed currently selected point button");
        turnOffOtherButtons(currentlySelectedPointButton);
        
      }
    });
    
    final TogglableButton newPointButton = new TogglableButton(loadImage("button.png"), x + 25, y + 75, 50, 25);
    newPointButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed new point button");
        turnOffOtherButtons(newPointButton);
        
      }
    });
    
    this.buttons.add(xButton);
    this.buttons.add(yButton);
    this.buttons.add(currentlySelectedPointButton);
    this.buttons.add(newPointButton);
    
    this.getNodes().addAll(buttons);
    
    if (buttons.get(0).isSelected){
      
      print("Hello");
      
        if (theKey == char(48)){
          newX = newX + str(theKey);
        }
        if (theKey == char(49)){
          newX = newX + str(theKey);
        }
        if (theKey == char(50)){
          newX = newX + str(theKey);
        }
        if (theKey == char(51)){
          newX = newX + str(theKey);
        }
        if (theKey == char(52)){
          newX = newX + str(theKey);
        }
        if (theKey == char(53)){
          newX = newX + str(theKey);
        }
        if (theKey == char(54)){
          newX = newX + str(theKey);
        }
        if (theKey == char(55)){
          newX = newX + str(theKey);
        }
        if (theKey == char(56)){
          newX = newX + str(theKey);
        }
        if (theKey == char(57)){
          newX = newX + str(theKey);
        }
        else{}
        
        
        xLabel = int(newX);
      }
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
