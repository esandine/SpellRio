public class ItemBlock extends Terrain implements Collectable{
  public boolean collected;
  PImage shroom;
  public ItemBlock(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
    collected = false;
    shroom = loadImage("mushroom.png");
  }
  public ItemBlock(String s){
    this(100,100,100,100,s);
     shroom = loadImage("mushroom.png");
  }
  public void upTrigger(Mario m){
    while(m.isInsideVerticle(this)){
      m.move(0,.1);
    }
    m.setJumpsLeft(2);
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
    if(random(10)<3){
      ts.add(new Mushroom(getXcor(),getYcor(),15,15,"iceFlower.png"));
    }else if(random(10)>3){
    ts.add(new Mushroom(getXcor(),getYcor(),15,15,"iceFlower.png"));
    setCollected(true);
    }else{
      ts.add(new Coin(getXcor(),getYcor(),15,15,"coin.png"));
      setCollected(true);
    }
  }
  public void setCollected(boolean b){
    collected=b;
  }
  public boolean getCollected(){
    return collected;
  }
}