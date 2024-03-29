//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*
Segment head;
 int foodX;
 int foodY;
 ArrayList <Segment> Segments =new ArrayList<Segment>();
 

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
 int x;
 int y;
 public Segment(int x, int y) {
 this.x = x;
 this.y = y;
 
 }
}
// Add a constructor with parameters to initialize each variable.


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*





//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
head=new Segment(50,60);
 size(500,500);
 frameRate(15);
    dropFood();
    
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10); 
     foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(255); 
move();
   drawSnake();
   drawFood();
eat();
}

void drawFood() {
  //Draw the food

  fill(255,0,0);     
    rect(foodX,foodY,10,10);
}
int direction=UP;
  int foodeaten=0;
    int i=2;
void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0,255,0);  
  
    rect(head.x,head.y,10,10);
    manageTail();
  }



//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
  
  for(int i=0; i<Segments.size(); i++){
fill(0,255,0);
    rect(Segments.get(i).x,Segments.get(i).y,10,10);
print(Segments.get(i).x+" "); 
}
}
void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  Segments.add(new Segment(head.x,head.y)); 
  Segments.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int i = 0; i<Segments.size(); i++){
  if(head.x==Segments.get(i).x&&head.y==Segments.get(i).y){
  foodeaten=1;
  Segments=new ArrayList <Segment>();
  Segments.add(new Segment(head.x,head.y));
  }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode==UP&&direction!=DOWN){
    direction=UP;  
}
if(keyCode==DOWN&&direction!=UP){
direction=DOWN;
}
if(keyCode==LEFT&&direction!=RIGHT){
 direction=LEFT; 
}
if(keyCode==RIGHT&&direction!=LEFT){
 direction=RIGHT; 
}
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
 switch(direction){
 case UP:
head.y-=10;
 break;
 case DOWN:
 head.y+=10;
 break;
 case LEFT:
 head.x-=10;
 break;
 case RIGHT:
 head.x+=10;
 }
 checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if (head.x >= 500){
  head.x=0;
 }
 else if (head.x<=0){
  head.x=500 ;
 }
 if (head.y<=0){
  head.y=500 ;
 }
 else if (head.y>=500){
  head.y=0 ;
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if (head.x==foodX&&head.y==foodY){
 foodeaten++;
foodX = ((int)random(50)*10); 
     foodY = ((int)random(50)*10);
 Segments.add(new Segment(head.x,head.y));     
}
}
