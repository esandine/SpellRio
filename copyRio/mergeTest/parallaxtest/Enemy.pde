public abstract class Enemy extends Terrain{
  public Enemy(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Enemy(String s){
    this(200,200,100,100,s);
  }
  public void upTrigger(Mario m){
    while(m.isInsideVerticle(this)){
      m.move(0,-.1);
    }
    // while mario is on top of goomba, then kill goomba. 
    die();
    print("GGGG:"+getHealth());
  }
  public void leftTrigger(Mario m){
    m.setHorizontal(m.getOldHorizontal());
    m.setHealth(m.getHealth()-1);
  }
  public void rightTrigger(Mario m){
    m.setHorizontal(m.getOldHorizontal());
    m.setHealth(m.getHealth()-1);
  }
  public void downTrigger(Mario m,ArrayList<Terrain> ts){
        while(m.isInsideVerticle(this)){
      m.move(0,-.1);
    }
    m.setHealth(m.getHealth()-1);
  }
  public void move(float x,float y){
    if(getHealth() == 1){
    setXcor(getXcor()+x);
    setYcor(getYcor()-y);
    if(getXcor()<0){
      setXcor(640);
    }
    if(getXcor()>640){
      setXcor(0);
    }
    }
  }
  public abstract void oneMove();
}