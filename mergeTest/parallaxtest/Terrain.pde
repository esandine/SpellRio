abstract class Terrain{ //An abstract class for all rectangular Terrain.
  private float xcor;
  private float ycor;
  private float length;
  private float height;
  public Terrain(float x,float y,float l,float h){
    xcor = x;
    ycor = y;
    length = l;
    height = h;
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
  public void move(float dx,float dy){
    setXcor(getXcor()+dx);
    setYcor(getYcor()-dy);
  }
  public abstract void display();
  public boolean isInside(Mario m){
    return (m.getXcor()>getXcor()) && (m.getXcor()<getXcor()+getLength()) && (m.getYcor()>getYcor()) && (m.getYcor()<getYcor()+getHeight());
  }
  
}