/*
Terrain - how it works
Terrain is an abstract class from which most of the objects (pipes,pits,coins,blocks,etc.)
are extended from.

Instance variables:

xcor and ycor are coordinates of the upper left corner of the terrain
length and height are the length and height of the piece of terrain
image is the image that is displayed when the display() function is called

Methods:

Accessors&Mutators for all variables
move(dx,dy) -- moves the piece of terrain the specified distance left and right. Note
               for dy positive numbers make the terrain go up.
display() -- displays the image of the terrain at its correct coordinates and dimensions
isInside(Mario m) -- returns a boolean whether or not Mario is currently inside the object
                     It is used to check if he is in a pit, or if he is in
                     a pipe and needs to be moved out.
upTrigger(Mario m) -- does a specified action when Mario enters the object from above
                      (for example m dies if he falls into a pit)
other triggers are similar
*/

abstract class Terrain{
  private float xcor;
  private float ycor;
  private float length;
  private float height;
  private PImage img;   
  PVector vpipe;
  float pipeVel;
  
  public Terrain(float x,float y,float l,float h, String s){
    xcor = x;
    ycor = y;
    length = l;
    height = h;
    img=loadImage(s);
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
  public void display(){
    image(getImage(),getXcor(),getYcor(),getLength(),getHeight());
  }
  public abstract void upTrigger(Mario m);//Triggers when Mario enters from above
  public abstract void downTrigger(Mario m);
  public abstract void leftTrigger(Mario m);
  public abstract void rightTrigger(Mario m);
  public boolean isInside(Mario m){
    return (m.getXcor()>getXcor()) && (m.getXcor()<getXcor()+getLength()) && (m.getYcor()>getYcor()) && (m.getYcor()<getYcor()+getHeight());
  }
}