class Mushroom{
  int xcor, ycor;
  public Mushroom(int x, int y){
    xcor = x;
    ycor = y;
  }
  public isAcquired(Mario m, Mushroom s){
    if ((m.getXcor() > s.getXcor() - 1.5) || (m.getYcor() > s.getYcor() - 1.5)) {
      m.setHealth(m.getHealth() + 1);
      mario.resize(30,30);
    }
  }
}

  