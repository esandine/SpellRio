public abstract class Enemy extends Terrain implements Collectable {
  boolean collected;
  public Enemy(float x, float y, float l, float h, String s) {
    super(x, y, l, h, s);
    collected=false;
  }
  public boolean getCollected() {
    return collected;
  }
  public void setCollected(boolean b) {
    collected=b;
  }
  public Enemy(String s) {
    this(200, 200, 100, 100, s);
  }
  public void upTrigger(Mario m) {
    //print("test");
    /*while(m.isInsideVerticle(this)){
     m.move(0,-.1);
     }*/
    // while mario is on top of goomba, then kill goomba. 
    setCollected(true);
  }
  public void leftTrigger(Mario m) {
    m.die();
  }
  public void rightTrigger(Mario m) {
    m.die();
  }
  public void downTrigger(Mario m, ArrayList<Terrain> ts) {
    while (m.isInsideVerticle(this)) {
      m.move(0, -.1);
    }

    if (m.getHasAGreenPowerUp()) {
      m.setYcor(height/2);
      m.setHorizontal(m.getHorizontal()+100);
      m.setGravity(10);
      m.setHasAGreenPowerUp(false);
    } else {
      m.setHealth(m.getHealth()-1);
    }
  }
  public void move(float x, float y) {
    if (getHealth() == 1) {
      setXcor(getXcor()+x);
      setYcor(getYcor()-y);
      if (getXcor()<0) {
        setXcor(2250);
      }
      if (getXcor()>2250) {
        setXcor(0);
      }
    }
  }
  public abstract boolean oneMove(ArrayList<Terrain> t);
}