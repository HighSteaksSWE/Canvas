 //
//TODO : modify it to save Canvas.width, Canvas.Hight



// Save Panel
public class SavePanel{
  Panel savePanel;
  MouseEventHandler saveEvent;
  CanvasModel model;
  
  public SavePanel(CanvasModel model){ 
    this.model = model;
    this.savePanel = new Panel(new Label("#####Save#####",  110, 120, color(0)) ,100, 100, 120, 120);
    this.savePanel.isActive = true;
    addSaveButton();// there is a better way to do this
    
  }
  
  public void addSaveButton(){
    Button saveButton = new Button(loadImage("save.png"), 130,130,40,40);
    saveButton.addEvent(new BottonEvent(){
      public void mouseReleased(CanvasModel model) {
        println("pressed save button");
        PImage partialSave = model.canvas.get();
        partialSave.save("partialSave.jpg");
        
      }
    });
    savePanel.addNode(saveButton);
  }
  
}
