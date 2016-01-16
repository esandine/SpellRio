public class Pit extends Terrain{
  public Pit(float x, float y, float l, float h, String s){
      super(x,y,l,h,s);
  }
  public Pit(String s){
      this(100,100,100,100,s);
  }
  public void upTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){  
    m.die();
  }
  public void leftTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){}
  public void rightTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){}
  public void downTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){}
}