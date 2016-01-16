public class Pipe extends Terrain{
  public Pipe(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Pipe(String s){
    this(100,100,100,100,s);
  }
  public void upTrigger(Mario m){
    while(m.isInside(this,m.getHorizontal(),m.getVerticle())){
      m.setVerticle(m.getVerticle()+.1);
    }
  }
  public void leftTrigger(Mario m){
    m.setHorizontal(m.getHorizontal());
  }
  public void rightTrigger(Mario m){
    m.setHorizontal(m.getOldHorizontal());
  }
  public void downTrigger(Mario m){
  };
}