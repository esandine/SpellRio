class Mushroom extends Terrain{
    boolean collected;
    Mushroom(float x, float y, float l, float h, String s){
      super(x,y,l,h,s);
      collected = false;
    }
  public void upTrigger(Mario m){
    incrementHealthNum(m);
  }
  public void downTrigger(Mario m,ArrayList<Terrain> ts){
    incrementHealthNum(m);
  }
  public void leftTrigger(Mario m){
    incrementHealthNum(m);
  }
  public void rightTrigger(Mario m){
    incrementHealthNum(m);
  }
    void display(){
      if(!collected){
        super.display();
      }
    }
  void incrementHealthNum(Mario m){
    if(collected == false){
      m.setHealth(2);
      print(m.getHealth());
      collected = true;
    }
  }
}
    
      
      
        























  