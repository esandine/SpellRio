class Coin extends Terrain{
    boolean collected;
    Coin(float x, float y, float l, float h, String s){
      super(x,y,l,h,s);
      collected = false;
    }
  public void upTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
    incrementCoinNum(m);
  }
  public void downTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
    incrementCoinNum(m);
  }
  public void leftTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
    incrementCoinNum(m);
  }
  public void rightTrigger(Mario m, float hori,float vert,float oldhori,float oldvert){
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
    
      
      
        