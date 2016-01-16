public class Pipe extends Terrain{
  public Pipe(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Pipe(String s){
    this(100,100,100,100,s);
  }
  public void upTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
    vert=oldvert;
    print("up");
  }
  public void leftTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
    hori=oldhori;
  }
  public void rightTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
    hori=oldhori;
  }
  public void downTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
              print("down");
  };
}