abstract class Terrain{ //An abstract class for all rectangular Terrain.
  private float xcor;
  private float ycor;
  private float length;
  private float height;
  private PImage img;   
  public Terrain(float x,float y,float l,float h, PImage p){
    xcor = x;
    ycor = y;
    length = l;
    height = h;
    img=p;
  }
  public float getXcor(){
    return xcor;
  }
  public float getYcor(){
    return ycor;
  }
  public float getLength(){
    return length;
  }
  public float getHeight(){
    return height;
  }
  public PImage getImage(){
    return img;
  }
  public void setXcor(float n){
    xcor = n;
  }
  public void setYcor(float n){
    ycor = n;
  }
  public void setLength(float n){
    length = n;
  }
  public void setHeight(float n){
    height = n;
  }
  public void setImage(PImage nimg){
    img = nimg;
  }
  public void move(float dx,float dy){
    setXcor(getXcor()+dx);
    setYcor(getYcor()-dy);
  }
  public void display(String s){
    setImage(loadImage(s));
    //getImage().resize((int)getXcor(),(int)getYcor());
    image(getImage(),getXcor(),getYcor(),getLength(),getHeight());
    //fill(0,0,0);
    //rect(getXcor(),getYcor(),getLength(),getHeight());
  }
  public abstract void display();
  public abstract void upTrigger(Mario m);//Triggers when Mario enters from above
  public abstract void downTrigger(Mario m);
  public abstract void leftTrigger(Mario m);
  public abstract void rightTrigger(Mario m);
  public boolean isInside(Mario m){
    return (m.getXcor()>getXcor()) && (m.getXcor()<getXcor()+getLength()) && (m.getYcor()>getYcor()) && (m.getYcor()<getYcor()+getHeight());
  }
}