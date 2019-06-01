class Segment{
 int x;
 int y;
 public Segment(int x, int y) {
 this.x = x;
 this.y = y;
 
 }
}
 Segment head;
 int foodX;
 int foodY;
 
void setup(){
  head=new Segment(5,6);
 size(500,500);
 frameRate(4);
    dropFood();
}

  void dropFood(){
     foodX = ((int)random(50)*10); 
     foodY = ((int)random(50)*10);
    }
   void draw(){
     background(255); 
   drawFood();
   drawSnake();
    }
  void drawFood(){
  fill(255,0,0);     
    rect(foodX,foodY,10,10);
   
  }
  void drawSnake(){
    fill(0,255,0);
    rect(head.x,head.y,10,10);
  }
  int direction=UP;
  int foodeaten=0;
    int i=2;
switch(direction){
 case UP:
 System.out.println(UP);
 case DOWN:
 System.out.println(UP);
 case LEFT:
 
 case RIGHT:
}

}
  
  void move(){
    checkBoundaries();
  }
