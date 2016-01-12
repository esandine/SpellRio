PImage back, middle, front;
PVector vback, vmiddle, vfront;
float groundheight;//The height of the brown bar at the bottom of the world
PImage pipe;
PVector vpipe;

void setup(){
  back = loadImage("back2.png");
  middle = loadImage("middle.png");
  front = loadImage("front2.png");
  pipe = loadImage("pipe.png");
  size(640, 420);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); //just fixing the position of the image
  vpipe = new PVector(0,0);
  frameRate(24);
  groundheight=380;
  

}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  //println("r: " + r + ", pos.x: " +pos.x);
  
  image(img, pos.x, pos.y);
  //fill(#ff0000);
  //rect(pos.x, 0, img.width, img.height);
}
Mario itsame = new Mario(width/2.0-15,height*5.0/6-50);// Makes Mario in the center
//boolean apressed = false;//Tracks whether or not the user is currently pressing "a"
//boolean dpressed = false;//Does the same with "d"
//int isjumping = 0;
//int jumpsleft = 2;//Keeps track of the amount of jumps left for mario, starts at two.
//float gravity;//A speed that adjusts based on the distance between mario and the ground.
void draw(){
  background(255);
/*  if(apressed){
    itsame.move(-3,0);
  }
  if(dpressed){
    itsame.move(3,0);
  }
  */
  itsame.moveLeftRight();
  itsame.moveUpDown(groundheight);
  paraDraw(back, vback, 1);
  paraDraw(middle, vmiddle, 2);
  paraDraw(front, vfront, 3);
  paraDraw(pipe,vpipe,4);
  itsame.display();
}
void keyPressed(){
  //If "w" is pressed, Mario jumps.
  if(key=='w'&&itsame.getJumpsLeft()>0){
    itsame.setIsJumping(15);
    itsame.setJumpsLeft(itsame.getJumpsLeft()-1);
  }
  //Keeps track of what keys are being pressed.
  if(key=='a'){
    itsame.setApressed(true);
  }
  if(key=='d'){
    itsame.setDpressed(true);
  }
}
void keyReleased(){
  if(key=='a'){
    itsame.setApressed(false);
  }
  if(key=='d'){
    itsame.setDpressed(false);
  }
}