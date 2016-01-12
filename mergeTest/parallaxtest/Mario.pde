PImage mario;
class Mario{
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  int isjumping;//Keeps track of how long he has been jumping. 0-15 
  int jumpsleft;//Keeps track of the double jump
  float gravity;//ADjusts gravity based on his position
  Mario(color C, float x, float y){
    c=C;
    xcor=x;
    ycor=y;
    isjumping=0;
    jumpsleft=2;
    gravity=0;
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
  //moveUpDown moves Mario either vertically up, or vertically down
  void moveUpDown(float groundheight){
    gravity = 15-((groundheight-itsame.getYcor())/38);//Readjusts gravity based on his height
    if(itsame.getYcor()<10){//If Mario is near the top he stops jumping
      itsame.setIsJumping(0);
    }
    if(itsame.getIsJumping()>0){//If mario is currently jumping move him up
      itsame.move(0,gravity);
      itsame.setIsJumping(itsame.getIsJumping()-1);
    }else{//If not, move him down
      itsame.move(0,-gravity);
    }
    if(itsame.getYcor()>groundheight){//If mario hits the ground
      itsame.move(0,itsame.getYcor()-groundheight);
      itsame.setJumpsLeft(2);
    }
  }
}