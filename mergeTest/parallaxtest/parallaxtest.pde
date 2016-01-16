PImage back, middle, front;
PVector vback, vmiddle, vfront,vpipe;
float spriteVel,pipeVel,bushVel,groundheight;
boolean lost = false;
int coinCount = 0;
final int minxcor = 2;
CoinCounter counter;
float backVel;
Terrain[]currentWorld = new Terrain[20];
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
  setTerrain();
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
void draw(){
  background(255);
  itsame.moveLeftRight(currentWorld);
  itsame.moveUpDown(groundheight,currentWorld);
  paraDraw(back, vback, backVel);
  paraDraw(middle, vmiddle, bushVel);
  paraDraw(front,vfront,spriteVel);
  itsame.display();
  for(int n = 0;n<currentWorld.length;n++){
    currentWorld[n].display();
  }
  counter.incrementCoinNum(itsame);
  counter.display();
  if((itsame.getHealth() == 0)){
   textSize(20);
   text("press R to Restart",width/2,height/2);
   //noLoop();
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
  }
  if(key=='d'){
    itsame.setDpressed(true);
    spriteVel = 3; 
    backVel = 1;
    bushVel = 2;
  }
  if(key=='r'){
    itsame = new Mario(width/2.0-15,((height*5.0/6-50)-100));// Makes Mario in the center
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
void setTerrain(){
  int counter = 0;
  for(int i = 0;i<currentWorld.length;i++){
    if(counter<5){
      float height = (float)Math.random()*200+200;
      currentWorld[i]=new Pipe((float)Math.random()*640,height,50,400-height,"pipe.png");
      counter++;
     }else if(Math.random()>.5){
      currentWorld[i]=new Pit((float)Math.random()*640,400,30,20,"pitPic.png");
     }else{
       currentWorld[i]= new Coin((float)Math.random()*620,(float)Math.random()*400+20,15,15,"coin.png");
     }
      
  }
}
  void movePipes(){
    for(int n = 0;n<currentWorld.length;n++){
      if(itsame.isInside(currentWorld[n])){
        itsame.move(100,100);
      }
    }
  }