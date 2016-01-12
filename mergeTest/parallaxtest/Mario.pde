PImage mario;
class Mario{
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  int isjumping;
  int jumpsleft;
  Mario(color C, float x, float y){
    c=C;
    xcor=x;
    ycor=y;
    isjumping=0;
    jumpsleft=2;
  }
  Mario(float x, float y){
    this(color(220,0,0),x,y);
  }
  Mario(){
    this(0,0);
  }
  /*
  Mario() {//Default Constructor
    c = color(220,0,0);//red
    xcor = width/2;//centered 
    ycor = height*5/6;//on the ground
  }
  */
  void display(){//Displays Mario
    mario=loadImage("runningMario.gif");
    image(mario,xcor,ycor);
  }
  void move(float dx,float dy){//Moves Mario a specified distance
    xcor+=dx;
    if(xcor>width){//the wrap around
      xcor=0;
    }
    if(xcor<0){
      xcor=width;
    }
    ycor-=dy;
    if(ycor<0){
      ycor=height;
    }
    if(ycor>height){
      ycor=0;
    }
  }
  float getXcor(){
    return xcor;
  }
  float getYcor(){
    return ycor;
  }
  color getC(){
    return c;
  }
  int getJumpsLeft(){
    return jumpsleft;
  }
  int getIsJumping(){
    return isjumping;
  }
  void setJumpsLeft(int n){
    jumpsleft = n;
  }
  void setIsJumping(int n){
    isjumping = n;
  }
  void jump(){
    setJumpsLeft(getJumpsLeft()-1);
    setIsJumping(15);
  }
    
}