PImage back, middle, front;
PVector vback, vmiddle, vfront;
float groundheight;//The height of the brown bar at the bottom of the world
PImage pipe;
PVector vpipe;
float spriteVel;
float bushVel;
float backVel;
Pipe[]pipes = new Pipe[10];
void setup(){
  back = loadImage("back2.png");
  middle = loadImage("middle.png");
  front = loadImage("front2.png");
  //p1.setImage(loadImage("pipe.png"));
  //p1.getImage().resize((int)p1.getXcor(),(int)p1.getYcor());
  size(640, 420);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); //just fixing the position of the image
  //vpipe = new PVector(0,0);
  frameRate(24);
  groundheight=380;
  spriteVel=0;
  bushVel=0;
  backVel=0;
  setPipes();
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
  //paraDraw(pipe,vpipe,0);
  itsame.display();
  for(int n = 0;n<pipes.length;n++){
    pipes[n].display();
  }
  //p1.display();
  //image(p1.getImage(),p1.getXcor(),p1.getYcor());
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
void setPipes(){
  for(int i = 0;i<pipes.length;i++){
    pipes[i]=new Pipe(pipe);
    float height = (float)Math.random()*200+200;
    pipes[i].setXcor((float)Math.random()*640);
    pipes[i].setYcor(height);
    pipes[i].setLength((float)Math.random()*50+50);
    pipes[i].setHeight(400-height);
    pipes[i].setImage(pipe);
  }
}