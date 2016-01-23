//import ddf.minim.*;
import java.util.*;
int matrixMove;
PImage back, middle, front;
PVector vback, vmiddle, vfront, vpipe;
float spriteVel, pipeVel, bushVel, groundheight;
boolean lost = false;
boolean won = false;
int coinCount = 0;
final int minxcor = 2;
CoinCounter counter;
float backVel;
ArrayList<Terrain> currentWorld = new ArrayList();
ArrayList<Terrain> currentEnemies = new ArrayList();
ArrayList<Terrain> currentBalls = new ArrayList();
ArrayList<ArrayList<Terrain>> currents = new ArrayList();
Mario itsame = new Mario();
//AudioPlayer player;
//Minim minim;
boolean paused;
//Goomba procrastination = new Goomba("dont do it");
//Setup is called at the beginning of the game

marioBall iceShot;


void setup() {
  /*minim = new Minim(this);
   player = minim.loadFile("backgroundMusic.mp3",2048);
   if(itsame.getHealth() > 0){
   player.play();
   }*/
  //It load sthe grond, middle, and background
  back = loadImage("backTest.png");
  middle = loadImage("middle.png");
  front = loadImage("qwre.png");
  paused = false;
  //Makes the size of the screen 640x420 also sets the framerate and textsize
  size(640, 420);
  textSize(13);
  frameRate(24);
  //Initiallizes the coin counter and mushroom
  counter = new CoinCounter();
  //Sets the groundheight and creates the Terrain
  groundheight=380;
  setTerrain(); 
  setEnemies();
  currents.add(currentWorld);
  currents.add(currentEnemies);
  currents.add(currentBalls);
}
void paraDraw(PImage img, PVector pos, float vel) {
  //pos.sub(vel, 0, 0);
  //int r = (int)pos.x+img.width;
  //if(r < width) image(img, r, pos.y);
  //if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  //if(pos.x < -img.width) pos.x = width;
  image(img, pos.x, pos.y);
  itsame = new Mario();
}
// makes original mario
void draw() {
  if (!itsame.getLost() && !paused) {
    //print(itsame.getHealth());  
    pushMatrix();
    itsame.setOldHorizontal(itsame.getHorizontal());
    background(255);
    itsame.moveLeftRight(currents);
    //procrastination.oneMove();
    //itsame.triggers(currentWorld);
    translate(itsame.getHorizontal(), 0);
    image(back, 2250, 420);
    image(middle, 0, 0);
    image(front, 0, 0);
    for (int n = 0; n<currents.size(); n++) {
      for (int nn = 0; nn<currents.get(n).size(); nn++) {
        currents.get(n).get(nn).display();
      }
    }
    for (int i = 0; i<currentEnemies.size(); i++) {
      ((Enemy)currentEnemies.get(i)).oneMove(currentWorld);
      for (int b = 0; b<currentBalls.size(); b++) {
        if ((currentEnemies.get(i).getXcor()<currentBalls.get(b).getXcor())&&(currentEnemies.get(i).getXcor()+currentEnemies.get(i).getLength()>currentBalls.get(b).getXcor()+currentBalls.get(b).getLength())&&(currentEnemies.get(i).getXcor()<currentBalls.get(b).getXcor())&&(currentEnemies.get(i).getYcor()+currentEnemies.get(i).getHeight()>currentBalls.get(b).getYcor()+currentBalls.get(b).getLength())) {
          currentEnemies.remove(i);
        }
      }
    }
    for (int i = 0; i<currentBalls.size(); i++) {
      ((Enemy)currentBalls.get(i)).oneMove(currentWorld);
    }
    //procrastination.display();
    popMatrix();
    itsame.moveUpDown(groundheight, currents);
  }
  if ((itsame.getHealth() == 0 && !lost)) {
    fill(204, 102, 0);
    textSize(20);
    text("press R to Restart", width/2, height/2);
    //noLoop();
    lost = true;
    textSize(13);
    redraw();
    paused = !paused;
  }
  if (itsame.getWon()&&!won) {
    print("won");
    fill(204, 102, 0);
    textSize(20);
    text("You Won! press R to Restart", width/2, height/2);
    textSize(13);
    redraw();
    paused = !paused;
    won=true;
  }
  for (int n = 0; n<currents.size(); n++) {
    for (int nn = 0; nn<currents.get(n).size(); nn++) {
      if ((currents.get(n).get(nn)).getCollected()) {
        currents.get(n).remove(currents.get(n).get(nn));
      }
    }
  }
  itsame.display();
  //print(itsame.getLoaded());
  counter.incrementCoinNum(itsame);
  counter.display();
  //println("Mario HP:" + itsame.getHealth());
  //println(itsame.getHasAGreenPowerUp());
  /*if(itsame.getLoaded()){
   iceShot = new marioBall(itsame.getXcor(),itsame.getYcor(),1,"ice","iceball.png");
   iceShot.display(itsame);
   }*/
}










// once pipe exits to the left, make it reappear as a difference height (randomized). 
void keyPressed() {
  //If "w" is pressed, Mario jumps.
  if (key=='w'&&itsame.getJumpsLeft()>0) {
    itsame.setIsJumping(15);
    itsame.setGravity(0);
    itsame.setJumpsLeft(itsame.getJumpsLeft()-1);
  }
  if (key=='a') {
    itsame.setApressed(true);
    spriteVel = -1; 
    backVel = -3;
    bushVel = -2;
  }
  if (key=='d') {
    itsame.setDpressed(true);
    spriteVel = 3; 
    backVel = 1;
    bushVel = 2;
  }
  if (key == 'g') {
    fill(255, 0, 0);
    rect(0, 0, height, width);
  }
}
void keyReleased() {
  if (key=='a') {
    itsame.setApressed(false);
    spriteVel = 0; 
    backVel = 0;
    bushVel = 0;
  }
  if (key == 'p') {
    // pause test
    paused = !paused;
    print(paused);
  }
  if (key=='d') {
    itsame.setDpressed(false);
    spriteVel = 0; 
    backVel = 0;
    bushVel = 0;
  }
  if (key=='r') {
    if (itsame.getHealth()>1) {
      paused = !paused;
      itsame = new Mario();// Makes Mario in the center
    }
  }
  if (key=='k') {
    print(itsame.getObtainedIceFlower());
    if (itsame.hasShell) {
      itsame.setHasShell(false);
      currentBalls.add(new Shell(itsame));
    }
    if (itsame.getObtainedIceFlower()) {
      currentBalls.add(new marioBall(itsame, "iceFlower"));
    }
  }
}
//make my terrain
void setTerrain() {
  int counter = 0;
  for (int i = 0; i<40; i++) {
    if (counter<20) {
      float height = (float)Math.random()*200+300;
      if (i>1) {
        currentWorld.add(new Pipe((float)(currentWorld.get(i-1).getXcor()+Math.random()*100)+currentWorld.get(i-1).getLength(), height-100, 50, 500-height, "pipe.png"));
        counter++;
        print(i);
      } else {
        currentWorld.add(new Pipe((float)(Math.random()*100)+30, height, 50, 400-height, "pipe.png"));
      }
    } else if (counter<30) {
      currentWorld.add(new Pit((float)Math.random()*1930+320, 399, 30, 20, "pitPic.png"));
      counter++;
      //     }else if(counter<15){
      //       currentWorld.add(new Coin((float)Math.random()*620,(float)Math.random()*400+20,15,15,"coin.png"));
    } else {
      if (random(5)<2) {
        float saveRandomX = ((float)Math.random()*1930+320);
        for (int dj=0; dj<random(5)+1; dj++) {
          currentWorld.add(new ItemBlock((saveRandomX +(30*dj)), 150, 30, 30, "itemblock.png"));
        }
      } else {
        currentWorld.add(new ItemBlock(((float)Math.random()*1930+320), 200, 30, 30, "questionblock.png"));
      }
    }
  }
  currentWorld.add(new Flag());
  //currentWorld.add(new Mushroom(300.0,350.0,10.0,10.0,"mushroom.png"));
  //currentWorld.add(new Enemy("test"));
}
void setEnemies() {
  for (int i = 0; i<20; i++) {
    if (i<15) {
      if (Math.random()>.5) {
        currentEnemies.add(new Koopa(((float)Math.random()*2250), 370, 30, 30, "koopa.png")); // changge this terrible pic
      } else {
        currentEnemies.add(new Goomba(((float)Math.random()*2250), 370, 30, 30, "goomba.png")); // changge this terrible pic
      }
    } else {
      currentEnemies.add(new Bullet(((float)Math.random()*2250), ((float)Math.random()*400), 30, 15, "Bullet.png"));
    }
  }
}
/*
void stop(){
 player.close();
 minim.stop();
 super.stop();
 }*/