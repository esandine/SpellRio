PImage back, middle, front;
PVector vback, vmiddle, vfront;
float groundheight;//The height of the brown bar at the bottom of the world
PImage pipe;
PVector vpipe;
float spriteVel;
float bushVel;
float backVel;

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
  spriteVel=0;
  bushVel=0;
  backVel=0;

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
void draw(){
  background(255);
  itsame.moveLeftRight();
  itsame.moveUpDown(groundheight);
  paraDraw(back, vback, backVel);
  paraDraw(middle, vmiddle, bushVel);
  paraDraw(front, vfront,spriteVel);
  paraDraw(pipe,vpipe,0);
  itsame.display();
}
void keyPressed(){
  //If "w" is pressed, Mario jumps.
   if(key=='w'&&itsame.getJumpsLeft()>0){
    itsame.setIsJumping(15);
    itsame.setGravity(0);
     itsame.setJumpsLeft(itsame.getJumpsLeft()-1);
   }
  if(key=='a'){
    itsame.setApressed(true);
    spriteVel = -1; 
    backVel = -3;
    bushVel = -2;
  }
  if(key=='d'){
    itsame.setDpressed(true);
    spriteVel = 3; 
    backVel = 1;
    bushVel = 2;
  }
}
void keyReleased(){
  if(key=='a'){
    itsame.setApressed(false);
    spriteVel = 0; 
    backVel = 0;
    bushVel = 0;
  }
  if(key=='d'){
    itsame.setDpressed(false);
    spriteVel = 0; 
    backVel = 0;
    bushVel = 0;
  }
}