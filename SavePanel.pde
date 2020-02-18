 //
//TODO : modify it to save Canvas.width, Canvas.Hight



// Save Panel
public class SavePanel{
  Panel savePanel;
  MouseEventHandler saveEvent;
  CanvasModel model;
 public TogglableButton save ;
  
  public SavePanel(CanvasModel model){ 
    this.model = model;
    this.savePanel = new Panel(new Label("save",  110, 120, color(0)) ,1300, 150, 120, 120);
    this.savePanel.isActive = true;
    addSaveButton();// there is a better way to do this
    
  }
  
  public void addSaveButton(){
    fill(0);
    TogglableButton saveButton = new TogglableButton(loadImage("save.png"), 1310, 490,28,40);
    saveButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed save button");
        PImage partialSave = model.canvas.get();
        partialSave.save("partialSave.jpg");
        
      }
    });
    save = saveButton;
    savePanel.addNode(saveButton);
  }
  
}
