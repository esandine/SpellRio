public class marioBall extends Enemy {
  public PImage bullet;
  float gravity;
  int direction;
  String bulletType;
  float x = 100;
  float speed =0.5;
  int radius = 50;


  public marioBall(float x, float y, float l, float h, String s, String qwer) {
    super(x, y, l, h, s);
    bulletType=qwer;
    if(itsame.getFacingLeft()){
      direction = -1;
    }else{
    direction = 1;
    }
    bulletType = qwer;
    gravity = 10;
  }
  public void upTrigger(Mario m) {
  }
  public void leftTrigger(Mario m) {
  }
  public void rightTrigger(Mario m) {
  }
  public void downTrigger(Mario m, ArrayList<Terrain> ts) {
  }
  public marioBall(Mario m, String qwer) {
    this(m.getXcor()-m.getHorizontal(), itsame.getYcor(), 15, 15, "Fireball.png", qwer);
  }
  // ACCESSORS:
  public String getBulletType() {
    return bulletType;
  }  
  public int getDirection() {
    return direction;
  }
  // MUTATORS:
  public void setBulletType(String s) {
    bulletType = s;
  }
  // if mario has obtained the ice flower then set the type variable to ice, and then set a new boolean called loaded to true, which makes pressing k release the buttons.
  float oldXcor;
  float getOldXcor() {
    return oldXcor;
  }
  void setOldXcor(float x) {
    oldXcor = x;
  }
  public boolean oneMove(ArrayList<Terrain> t) {
    if (getYcor()>390) {
      gravity = -5;
    }
    gravity +=.5;
    setOldXcor(getXcor());
    move(direction*5, -gravity);
    for (int i = 0; i<t.size(); i++) {
      //if (t.get(i).getYcor()+t.get(i).getHeight()>=getYcor()+15) {
        if(!((getXcor()+getLength()>t.get(i).getXcor())&&(getXcor()<t.get(i).getXcor()+t.get(i).getLength()))){
        if ((getXcor()<t.get(i).getXcor()+t.get(i).getLength())&&(!(getOldXcor()<t.get(i).getXcor()+t.get(i).getLength()))&&(t.get(i).getYcor()+t.get(i).getHeight()>=400)){
          return true;
        }
        if ((getXcor()+getLength()>t.get(i).getXcor())&&(!((getOldXcor()+getLength()>t.get(i).getXcor())))) {
          return true;
        }
      }
    }
    return false;
  }
}