public class Pit extends Terrain{
  public Pit(float x, float y, float l, float h, PImage p){
      super(x,y,l,h,p);
  }
  public Pit(PImage p){
      this(100,100,100,100,p);
  }
  public void display(){
    display("pitPic.png");
  }
  public void upTrigger(Mario m){  
    m.die();
  }
  public void leftTrigger(Mario m){}
  public void rightTrigger(Mario m){}
  public void downTrigger(Mario m){}
}