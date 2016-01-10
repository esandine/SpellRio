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
void draw(){
  itsame.move(1,0);//moves mario continously
  setup();
  itsame.display();  
}