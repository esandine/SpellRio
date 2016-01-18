
public class Pipe extends Terrain{
  public Pipe(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Pipe(String s){
    this(100,100,100,100,s);
  }
  public void upTrigger(Mario m){
    while(m.isInsideVerticle(this)){
      m.move(0,.1);
    }
  }
  public void leftTrigger(Mario m){
    m.setHorizontal(m.getOldHorizontal());
  }
  public void rightTrigger(Mario m){
    m.setHorizontal(m.getOldHorizontal());
  }
  public void downTrigger(Mario m){
  };
}