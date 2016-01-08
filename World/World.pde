void setup(){
  clear();//resets the world
  color backcolor = color(0,120,0);//green
  fullScreen();
  background(backcolor);//backround is green
  color ground = color(220,120,0);//brown
  fill(ground);
  rect(0,5*height/6,width,height/6);//bottom sixth of the screen
}
Mario itsame = new Mario();
void draw(){
  itsame.move(0,1);
  setup();
  itsame.display();
}