class Mushroom extends Terrain{
  boolean collected;
  public Mushroom(float x, float y,float l, float h, String s){
     super(x,y,l,h,s);
     collected=false;
  }
  public void setCollected(boolean b){
    collected=b;
  }
  public boolean getCollected(){
    return collected;
  }
  public void upTrigger(Mario m){
      m.setHealth(2);
      mario.resize(100,100);
      setCollected(true);
  }
  public void downTrigger(Mario m){
      m.setHealth(2);
      mario.resize(100,100);
      setCollected(true);
  }
  public void leftTrigger(Mario m){
      m.setHealth(2);
      mario.resize(100,100);
      setCollected(true);
  }
  public void rightTrigger(Mario m){
      m.setHealth(2);
      mario.resize(100,100);
      setCollected(true);
  }
  void display(){
    if(!collected){
      display();
    }
  }
}

  