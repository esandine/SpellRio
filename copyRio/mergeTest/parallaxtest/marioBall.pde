public class marioBall{
  public PImage bullet;
  boolean released;
  float xcor;
  float ycor;
  float gravity;
  int direction;
  String bulletType;
  float x = 100;
  float speed =0.5;
  int radius = 50;

  
  
  public marioBall(float x,float y,int d,String qwer,String s){
    bullet = loadImage(s);
    released = false;
    xcor = x;
    ycor = y;
    this.x = x; 
    direction = d;
    bulletType = qwer;
  }
  // ACCESSORS:
  public String getBulletType(){
    return bulletType;
  }  
  public int getDirection(){
    return direction;
  }
  // MUTATORS:
 public void setBulletType(String s){
   bulletType = s;
 }
  // if mario has obtained the ice flower then set the type variable to ice, and then set a new boolean called loaded to true, which makes pressing k release the buttons. 
  public void isLoaded(Mario m){
    if (m.obtainedIceFlower){
      setBulletType("ice");
      m.setLoaded(true);
    }
  }
  void display(Mario m){
    if(m.getLoaded()){
      //image(bullet,xcor,ycor);
      smooth();
      ellipseMode(RADIUS);
      fill(0,255,255);
      x+= speed * direction;     
    }  
  }
}