public class Flag extends Terrain{
  public Flag(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Flag(){
    this(2890, 0, 50, height, "Flag.png");
  }
  public void upTrigger(Mario m){
    m.setWon(true);
  }
  public void leftTrigger(Mario m){
    m.setWon(true);
  }
  public void rightTrigger(Mario m){
    m.setWon(true);
  }
  public void downTrigger(Mario m, ArrayList<Terrain> ts){
    m.setWon(true);
  }
}