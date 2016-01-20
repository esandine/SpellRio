//import ddf.minim.*;
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
Mario itsame = new Mario();
//AudioPlayer player;
//Minim minim;


//Setup is called at the beginning of the game
void setup(){
  /*minim = new Minim(this);
  player = minim.loadFile("backgroundMusic.mp3",2048);
  if(itsame.getHealth() > 0){
    player.play();
  }*/
  //It load sthe grond, middle, and background
  back = loadImage("Mario.jpg");
  middle = loadImage("middle.png");
  front = loadImage("qwre.png");
  //Makes the size of the screen 640x420 also sets the framerate and textsize
  size(640, 420);
  textSize(13);
  frameRate(24);
  //Initiallizes the coin counter and mushroom
  counter = new CoinCounter();
  //Sets the groundheight and creates the Terrain
  groundheight=380;
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
  //itsame.triggers(currentWorld);
  translate(itsame.getHorizontal(),itsame.getVerticle());
  image(back,0,0);
  image(middle,0,0);
  image(front,0,0);
  for(int n = 0;n<currentWorld.size();n++){
    currentWorld.get(n).display();
  }
  popMatrix();
  itsame.moveUpDown(groundheight,currentWorld);
  if((itsame.getHealth() == 0)){
   textSize(20);
   text("press R to Restart",width/2,height/2);
   //noLoop();
   lost = true;
   textSize(13);
   redraw();
  }
  for(int n = 0;n<currentWorld.size();n++){
       if((currentWorld.get(n)).getCollected()){
         currentWorld.remove(n);
       }
  }
  itsame.display();
  counter.incrementCoinNum(itsame);
  counter.display();
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
  for(int i = 0;i<17;i++){
    if(counter<5){
      float height = (float)Math.random()*200+200;
      currentWorld.add(new Pipe((float)Math.random()*640,height,50,400-height,"pipe.png"));
      counter++;
     }else if(counter<10){
      currentWorld.add(new Pit((float)Math.random()*640,399,30,20,"pitPic.png"));
      counter++;
//     }else if(counter<15){
//       currentWorld.add(new Coin((float)Math.random()*620,(float)Math.random()*400+20,15,15,"coin.png"));
     }else{
       if(random(5)<6){
         float saveRandom = ((float)random(10)+200);
         float saveRandomX = ((float)Math.random()*620);
         for(int dj=0;dj<5;dj++){
           currentWorld.add(new ItemBlock((saveRandomX +(25*dj)),saveRandom,30,30,"questionblock.png"));
         }
       }else{
       currentWorld.add(new ItemBlock((float)Math.random()*620,(float)Math.random()*400+20,30,30,"itemblock.png"));
     }
     }
      
  }
  //currentWorld.add(new Mushroom(300.0,350.0,10.0,10.0,"mushroom.png"));
}
/*
void stop(){
  player.close();
  minim.stop();
  super.stop();
}*/