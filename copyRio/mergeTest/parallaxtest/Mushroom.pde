class Mushroom{
  int xcor, ycor;
  PImage mushroom;
  boolean collided;
  public Mushroom(int x, int y){
    xcor = x;
    ycor = y;
    collided = false;
  }
  void isAcquired(Mario m, Mushroom s){
    if (m.getXcor()>s.getXcor()-2) {
      m.setHealth(2);
      mario.resize(100,100);
      s.collided = true;
    }
  }
  void display(){
    if(!collided){
    mushroom = loadImage("mushroom.png");
    mushroom.resize(50,50);
    image(mushroom,xcor,ycor);
    }
}
  float getXcor(){
    return xcor;
  }
  float getYcor(){
    return ycor;
  }
   
  
}

  