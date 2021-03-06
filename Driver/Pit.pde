public class Pit extends Terrain{
  public Pit(float x, float y, float l, float h, String s){
      super(x,y,l,h,s);
  }
  public Pit(String s){
      this(100,100,100,100,s);
  }
  public void upTrigger(Mario m){  
    if(m.getHasAGreenPowerUp()){
    m.die();
    }else{
      m.setHealth(0);
    }
  }
  public void leftTrigger(Mario m){}
  public void rightTrigger(Mario m){}
  public void downTrigger(Mario m,ArrayList<Terrain> ts){}
}