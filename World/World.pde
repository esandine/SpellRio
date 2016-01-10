void setup(){
  size(640,360);
  clear();//resets the world
  color backcolor = color(0,120,0);//green
  //size(640,360);
  background(backcolor);//backround is green
  color ground = color(220,120,0);//brown
  fill(ground);
  rect(0,5*height/6,width,height/6);//bottom sixth of the screen
}
Mario itsame = new Mario(width/2.0-15,height*5.0/6-50);// Makes Mario in the center
boolean wpressed = false;
boolean apressed = false;
boolean spressed = false;
boolean dpressed = false;


void draw(){
  if(wpressed){
    itsame.move(0,1);
  }
  if(apressed){
    itsame.move(-1,0);
  }
  if(spressed){
    itsame.move(0,-1);
  }
  if(dpressed){
    itsame.move(1,0);
  }
  //itsame.move(1,0);//moves mario continously
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
  if(key=='s'){
    spressed=true;
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
  if(key=='s'){
    spressed=false;
  }
  if(key=='d'){
    dpressed=false;
  }
}