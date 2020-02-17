public class Selected {
  
  Boolean selected;
  
  public Selected(Boolean selecting){
    this.selected = selecting;
  }
  
  public void select(){
    this.selected = true;
  }
  
  public Boolean isSelected(){
    return this.selected;
  }
  
  public void deselect(){
    this.selected = false;
  }
}
