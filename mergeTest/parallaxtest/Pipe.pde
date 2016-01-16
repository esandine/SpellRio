public class Pipe extends Terrain{
  public Pipe(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Pipe(String s){
    this(100,100,100,100,s);
  }
  public void upTrigger(Mario m){
    while(m.isInside(this)){
       m.move(0,.1);
       m.setJumpsLeft(2);
    }
  }
  public void leftTrigger(Mario m){
    m.setXcor(getXcor()-.1);
  }
  public void rightTrigger(Mario m){
    m.setXcor(getXcor()+getLength()+.1);
  }
  public void downTrigger(Mario m){
  };
}