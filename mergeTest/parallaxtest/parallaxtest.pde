import java.util.*;
int matrixMove;
PImage back, middle, front;
PVector vback, vmiddle, vfront,vpipe;
float spriteVel,pipeVel,bushVel,groundheight;
boolean lost = false;
int coinCount = 0;
final int minxcor = 2;
CoinCounter counter;
float backVel;
ArrayList<Terrain> currentWorld = new ArrayList();
Mushroom mushTest;
Mario itsame = new Mario();




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
  mushTest = new Mushroom(300,350);
  groundheight=380;
  spriteVel=0;
  bushVel=0;
  backVel=0;
  pipeVel = 5;
  setTerrain();
}
void paraDraw(PImage img, PVector pos, float vel){
  //pos.sub(vel, 0, 0);
  //int r = (int)pos.x+img.width;
  //if(r < width) image(img, r, pos.y);
  //if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  //if(pos.x < -img.width) pos.x = width;
  image(img, pos.x, pos.y);
  itsame = new Mario();
}
// makes original mario
void draw(){
  pushMatrix();
  itsame.setOldHorizontal(itsame.getHorizontal());
  itsame.setOldVerticle(itsame.getVerticle());
  background(255);
  itsame.moveLeftRight(currentWorld);
  itsame.moveUpDown(currentWorld);
  //itsame.triggers(currentWorld);
  translate(itsame.getHorizontal(),itsame.getVerticle());
  image(back,0,0);
  image(middle,0,0);
  image(front,0,0);
  for(int n = 0;n<currentWorld.size();n++){
    currentWorld.get(n).display();
  }
//  mushTest.isAcquired(itsame,mushTest);
  //mushTest.display();
  popMatrix();
  if((itsame.getHealth() == 0)){
   textSize(20);
   text("press R to Restart",width/2,height/2);
   //noLoop();
   lost = true;
   textSize(13);
   redraw();
  }
  itsame.display();
  counter.incrementCoinNum(itsame);
  counter.display();

}
// once pipe exits to the left, make it reappear as a difference height (randomized). 
void keyPressed(){

  //If "w" is pressed, Mario jumps.
   if(key=='w'&&itsame.getJumpsLeft()>0){
    //itsame.setIsJumping(15);
    if(itsame.getVerticle()>10){
      itsame.setVerticle(itsame.getVerticle()+10);
    }
    else{
      itsame.setVerticle(0);
    }
    itsame.setGravity(0);
    itsame.setJumpsLeft(itsame.getJumpsLeft()-1);
    itsame.setGroundSurface(-10);
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
    itsame = new Mario();// Makes Mario in the center
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
  for(int i = 0;i<15;i++){
    if(counter<5){
      float height = (float)Math.random()*200+200;
      currentWorld.add(new Pipe((float)Math.random()*640,height,50,400-height,"pipe.png"));
      counter++;
     }else if(counter<10){
      currentWorld.add(new Pit((float)Math.random()*640,400,30,20,"pitPic.png"));
      counter++;
     }else{
       currentWorld.add(new Coin((float)Math.random()*620,(float)Math.random()*400+20,15,15,"coin.png"));
     }
      
  }
}