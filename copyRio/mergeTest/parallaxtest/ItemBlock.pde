public class ItemBlock extends Terrain implements Collectable{
  public boolean collected;
  public ItemBlock(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
    collected = false;
  }
  public ItemBlock(String s){
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
  public void downTrigger(Mario m,ArrayList<Terrain> ts){
    while(m.isInsideVerticle(this)){
      m.move(0,-.1);
    }
    ts.add(new Coin(getXcor(),getYcor(),15,15,"coin.png"));
    setCollected(true);
  }
  public void setCollected(boolean b){
    collected=b;
  }
  public boolean getCollected(){
    return collected;
  }
}