public class Shell extends Enemy{
  int direction;
  public Shell(Mario m) {
    super(m.getXcor()-m.getHorizontal()+m.getHsize(), m.getYcor(), 15, 15, "shell.png");
<<<<<<< HEAD
=======
    if(itsame.getFacingLeft()){
      direction = -1;
    }
    else{
      direction = 1;
    }
>>>>>>> 9cb7ba5209e7e5f055e426bbfb3b63270c574ae0
  }
  float oldXcor;
  float getOldXcor() {
    return oldXcor;
  }
  void setOldXcor(float x) {
    oldXcor = x;
  }
  public void oneMove(ArrayList<Terrain> t) {
    setOldXcor(getXcor());
    move(direction*5, 0);
    for (int i = 0; i<t.size(); i++) {
      if (t.get(i).getYcor()+t.get(i).getHeight()>=getYcor()) {
        //if(!((getXcor()+getLength()>t.get(i).getXcor())&&(getXcor()<t.get(i).getXcor()+t.get(i).getLength()))){
        if ((getXcor()<t.get(i).getXcor()+t.get(i).getLength())&&(!(getOldXcor()<t.get(i).getXcor()+t.get(i).getLength()))&&(t.get(i).getYcor()+t.get(i).getHeight()>=400)) {
          direction = 1;
        }
        if ((getXcor()+getLength()>t.get(i).getXcor())&&(!((getOldXcor()+getLength()>t.get(i).getXcor())))) {
          direction = -1;
        }
      }
    }
  }
  }