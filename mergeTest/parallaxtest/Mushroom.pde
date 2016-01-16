class Mushroom{
  int xcor, ycor;
  PImage mushroom;
  public Mushroom(int x, int y){
    xcor = x;
    ycor = y;
  }
  void isAcquired(Mario m, Mushroom s){
    if ((m.getXcor() > s.getXcor() - 1.5) || (m.getYcor() > s.getYcor() - 1.5)) {
      m.setHealth(m.getHealth() + 1);
      mario.resize(50,50);
    }
  }
  void display(){
    mushroom = loadImage("mushroom.png");
    mushroom.resize(10,10);
    image(mushroom,xcor,ycor);
}
  float getXcor(){
    return xcor;
  }
  float getYcor(){
    return ycor;
  }
   
  
}

  