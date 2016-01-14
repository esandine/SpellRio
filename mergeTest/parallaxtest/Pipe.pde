public class Pipe extends Terrain{
  public Pipe(float x, float y, float l, float h, PImage image){
    super(x,y,l,h,image);
  }
  public Pipe(PImage image){
    this(100,100,100,100,image);
  }
  public void display(){
    display("pipe.png");
  }
  public void upTrigger(Mario m){
    while(m.isInside(this)){
      m.move(0,.1);
    }
  }
  public void leftTrigger(Mario m){
    while(m.isInside(this)){
      m.move(-.1,0);
    }
  }
  public void rightTrigger(Mario m){
    while(m.isInside(this)){
      m.move(.1,0);
    }
  }
  public void downTrigger(Mario m){
  };
}