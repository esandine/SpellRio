float groundheight;
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
boolean wpressed = false;
boolean apressed = false;
boolean dpressed = false;
float gravity;
void draw(){
  if(wpressed){
    itsame.move(0,1);
  }
  if(apressed){
    itsame.move(-1,0);
  }
  if(dpressed){
    itsame.move(1,0);
  }
  gravity = 10-((groundheight-itsame.getYcor())/27);
  itsame.move(0,-gravity);
  //itsame.move(1,0);//moves mario continously
  if(itsame.getYcor()>groundheight){
    itsame.move(0,itsame.getYcor()-groundheight);
  }
  setup();
  itsame.display();  
}

void keyPressed(){
  if(key=='w'){
    wpressed=true;
  }
  if(key=='a'){
    apressed=true;
  }
  if(key=='d'){
    dpressed=true;
  }
}
void keyReleased(){
  if(key=='w'){
    wpressed=false;
  }
  if(key=='a'){
    apressed=false;
  }
  if(key=='d'){
    dpressed=false;
  }
}