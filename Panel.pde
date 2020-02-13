public class Panel extends Node {
   Sprite moveHandleSprite;
   int x, y, w, h;
   color fill;
   
   public Panel(PImage handle, int x, int y, int w, int h) {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;
     this.moveHandleSprite = new Sprite(handle, x + 1, y + 1, w - 2, 20, color(255));
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
        this.x = mouseX;
        this.y = mouseY;
        moveHandleSprite.setProperty("x", x + 1);
        moveHandleSprite.setProperty("y", y + 1);
      }
   }
}
