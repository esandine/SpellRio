public class Pit extends Terrain{
  private color pitColor;
  public Pit(float x, float y, float l, float h, int c){
      super(x,y,l,h);
      pitColor = c;
  }
  public Pit(color c){
      this(100,100,100,100,c);
  }
  
  public color getColor(){
      return pitColor;
  }
  
  public void setColor(int r, int g, int b){
      pitColor = color(r,g,b);
  }
  
  public void display(){
    setColor(255,204,0);
    fill(0,0,0);
    rect(getXcor(),getYcor(),getHeight(),getLength());
  }
  public void upTrigger(Mario m){  
    m.die();
  }
  public void leftTrigger(Mario m){}
  public void rightTrigger(Mario m){}
  public void downTrigger(Mario m){}
}