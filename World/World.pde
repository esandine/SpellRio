void setup(){
  clear();
  color backcolor = color(0,120,0);
  fullScreen();
  background(backcolor);
  color ground = color(220,120,0);
  fill(ground);
  rect(0,5*height/6,width,height/6);
}
Mario itsame = new Mario();
void draw(){
  itsame.move(10,0);
  setup();
  itsame.display();
}