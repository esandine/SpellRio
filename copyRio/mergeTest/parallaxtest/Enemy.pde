public abstract class Enemy extends Terrain{
  public Enemy(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Enemy(String s){
    this(200,200,100,100,s);
  }
  public void display(){
    fill(255,0,0);
    rect(getXcor(),getYcor(),getLength(),getHeight());
  }
  public void upTrigger(Mario m){
    while(m.isInsideVerticle(this)){
      m.move(0,-.1);
    }
    m.setHealth(m.getHealth()-1);
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
    setXcor(getXcor()+x);
    setYcor(getYcor()-y);
  }
  public abstract void oneMove();
}