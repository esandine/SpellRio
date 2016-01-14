PImage back, middle, front;
PVector vback, vmiddle, vfront,vpipe;
PImage pipe;
float spriteVel,pipeVel,bushVel,groundheight;
boolean lost = false;
int coinCount = 0;
Coin[]coinArray = new Coin[10];
final int minxcor = 2;
Pit p;
CoinCounter counter;
float backVel;
Pipe[]pipes = new Pipe[10];
void setup(){
  back = loadImage("back2.png");
  middle = loadImage("middle.png");
  front = loadImage("front2.png");
  size(640, 420);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vpipe = new PVector(0,0);
  vfront = new PVector(0, 5); //just fixing the position of the image
  textSize(13);
  frameRate(24);
  counter = new CoinCounter();
  groundheight=380;
  spriteVel=0;
  bushVel=0;
  backVel=0;
  pipeVel = 5;
  setPipes();
  for(int i = 0;i < coinArray.length;i++){
    coinArray[i] = new Coin(((int)random(620)),((int)(120-random(100))));
  }
}
void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  int r = (int)pos.x+img.width;
  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  image(img, pos.x, pos.y);
}

void paraDrawPit(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  int r = (int)pos.x+img.width;
  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  image(img, pos.x, pos.y,600,450);
}

Mario itsame = new Mario(width/2.0-15,((height*5.0/6-50)-100));// Makes Mario in the center
Coin c = new Coin(300,50);
void draw(){
  background(255);
  itsame.moveLeftRight(pipes);
  itsame.moveUpDown(groundheight,pipes);
  paraDraw(back, vback, backVel);
  paraDraw(middle, vmiddle, bushVel);
  paraDrawPit(front, vfront,spriteVel);
  //paradraw each pipe to the left. 
  itsame.display();
  c.display();
  counter.incrementCoinNum(1,itsame,c);
  counter.display();
  for(int n = 0;n<pipes.length;n++){
    pipes[n].display();
  }
  for(int n = 0; n < coinArray.length; n++){
    coinArray[n].display();
    counter.incrementCoinNum(1,itsame,coinArray[n]);
  }
  //p.display();
  if((itsame.getHealth() == 0)){
   textSize(20);
   text("Click To Restart",300,200);
   noLoop();
   lost = true;
   textSize(13);
   redraw();
  }
  if(itsame.getYcor() >450){
    itsame.die();
  }
  
    
}


// once pipe exits to the left, make it reappear as a difference height (randomized). 
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
    for(int i =0; i <pipes.length;i++){
        if(pipes[i].getXcor() == 0){
          //regenerate at the right side with xcor = maxxcor
           pipes[i].setXcor(630);
        }
        pipes[i].setXcor(pipes[i].getXcor()+1);
    }           
  }
  if(key=='d'){
    itsame.setDpressed(true);
    spriteVel = 3; 
    backVel = 1;
    bushVel = 2;
     for(int i =0; i <pipes.length;i++){
        if(pipes[i].getXcor() == 0){
          //regenerate at the right side with xcor = maxxcor
           pipes[i].setXcor(630);
        }
        pipes[i].setXcor(pipes[i].getXcor()-1);
   }
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
    pipes[i].setLength(50);
    pipes[i].setHeight(400-height);
    pipes[i].setImage(pipe);
  }
}
  void movePipes(){
    for(int n = 0;n<pipes.length;n++){
      if(itsame.isInside(pipes[n])){
        itsame.move(100,100);
      }
    }
  }
  /*void setPit(){
    p = new Pit(300,300,100,100,color(255,399,0));
    p.display();
  }*/