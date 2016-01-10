float groundheight;//The height of the brown bar at the bottom of the world
void setup(){
  size(640,360);
  clear();//resets the world
  color backcolor = color(0,120,0);//green
  //size(640,360);
  background(backcolor);//backround is green
  color ground = color(220,120,0);//brown
  fill(ground);
  groundheight=5*height/6;
  rect(0,groundheight,width,height/6);//bottom sixth of the screen
}
Mario itsame = new Mario(width/2.0-15,height*5.0/6-50);// Makes Mario in the center
boolean apressed = false;//Tracks whether or not the user is currently pressing "a"
boolean dpressed = false;//Does the same with "d"
int jumpsleft = 2;//Keeps track of the amount of jumps left for mario, starts at two.
float gravity;//A speed that adjusts based on the distance between mario and the ground.
void draw(){
  //If a or d is pressed, mario moves
  if(apressed){
    itsame.move(-3,0);
  }
  if(dpressed){
    itsame.move(3,0);
  }
  //Gravity is checked based on how high above the ground mario is.
  gravity = 5-((groundheight-itsame.getYcor())/54);
  itsame.move(0,-gravity);
  //If mario is below the ground this shifts him up. It also resets his double jump
  if(itsame.getYcor()>groundheight){
    itsame.move(0,itsame.getYcor()-groundheight);
    jumpsleft=2;
  }
  //Clears and displays Mario
  setup();
  itsame.display();  
}

void keyPressed(){
  //If "w" is pressed, Mario jumps.
  if(key=='w'&&jumpsleft>0){
    itsame.move(0,150);
    jumpsleft-=1;
  }
  //Keeps track of what keys are being pressed.
  if(key=='a'){
    apressed=true;
  }
  if(key=='d'){
    dpressed=true;
  }
}
void keyReleased(){
  if(key=='a'){
    apressed=false;
  }
  if(key=='d'){
    dpressed=false;
  }
}