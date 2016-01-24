public class Koopa extends Enemy {
  int direction = 1;
  public Koopa(float x, float y, float l, float h, String s) {
    super(x, y, l, h, s);
  }
  float oldXcor;
  float getOldXcor() {
    return oldXcor;
  }
  void setOldXcor(float x) {
    oldXcor = x;
  }
  public boolean oneMove(ArrayList<Terrain> t) {
    setOldXcor(getXcor());
    move(direction*.5, 0);
    for (int i = 0; i<t.size(); i++) {
      //if(!((getXcor()+getLength()>t.get(i).getXcor())&&(getXcor()<t.get(i).getXcor()+t.get(i).getLength()))){
      if ((getXcor()<t.get(i).getXcor()+t.get(i).getLength())&&(!(getOldXcor()<t.get(i).getXcor()+t.get(i).getLength()))&&(t.get(i).getYcor()+t.get(i).getHeight()>=400)) {
        direction = 1;
      }
      if ((getXcor()+getLength()>t.get(i).getXcor())&&(!((getOldXcor()+getLength()>t.get(i).getXcor())))) {
        direction = -1;
      }
    }
    return true;
  }
  public void upTrigger(Mario m) {
    //print("test");
    /*while(m.isInsideVerticle(this)){
     m.move(0,-.1);
     }*/
    // while mario is on top of goomba, then kill goomba. 
    setCollected(true);
    m.setHasShell(true);
    print("changedpic");
    //print(m.getHasShell());
  }
}