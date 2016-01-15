class Coin extends Terrain{
    boolean collected;
    Coin(float x, float y, float l, float h, String s){
      super(x,y,l,h,s);
      collected = false;
    }
  public void upTrigger(Mario m){
    incrementCoinNum(m);
  }
  public void downTrigger(Mario m){
    incrementCoinNum(m);
  }
  public void leftTrigger(Mario m){
    incrementCoinNum(m);
  }
  public void rightTrigger(Mario m){
    incrementCoinNum(m);
  }
    void display(){
      if(!collected){
        super.display();
      }
    }
  void incrementCoinNum(Mario m){
    if(collected == false){
      m.setCoinsCollected(m.getCoinsCollected()+1);
      collected = true;
    }
  }
}
    
      
      
        