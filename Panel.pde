public class Panel extends Group {
   Node moveHandleSprite;
   int w, h;
   color fill;
   
   public Panel(Node handle, int x, int y, int w, int h) {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;
     this.moveHandleSprite = handle;
     this.fill = color(255);
     this.nodes.add(moveHandleSprite);
   }
   
   public void display(CanvasModel model) {
     fill(fill);
     rect(x,y,w,h);
     super.display(model);
   }
   
   public void mouseDragged(CanvasModel model) {
      if(moveHandleSprite.isSelected()) {
        this.isSelected = true;
        super.mouseDragged(model);
      }
   }
}
