PImage mario;
class Mario{
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  int isjumping;//Keeps track of how long he has been jumping. 0-15 
  int jumpsleft;//Keeps track of the double jump
  float gravity;//ADjusts gravity based on his position
  boolean apressed;//Keeps track of whether a or d are pressed
  boolean dpressed;
  int health; 
  int coinscollected;
  
  Mario(color C, float x, float y){
    c=C;
    xcor=x;
    ycor=y;
    isjumping=0;
    jumpsleft=2;
    gravity=10;
    apressed=false;
    dpressed=false;
    health = 1;
    coinscollected=0;
  }
  Mario(float x, float y){
    this(color(220,0,0),x,y);
  }
  Mario(){
    this(0,0);
  }
  void display(){//Displays Mario
  if(getHealth() > 0){
    mario=loadImage("standingMario.gif");
    image(mario,xcor,ycor-6);
  }
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
  //Accessors
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
  boolean getApressed(){
    return apressed;
  }
  boolean getDpressed(){
    return dpressed;
  }
  int getHealth(){
    return health;
  }
  int getCoinsCollected(){
    return coinscollected;
  }
  //Mutators
  void setXcor(float x){
      xcor = x;
  }
  void setYcor(float y){
      ycor = y;
  }
  void setJumpsLeft(int n){
    jumpsleft = n;
  }
  void setIsJumping(int n){
    isjumping = n;
  }
  void setApressed(boolean tf){
    apressed=tf;
  }
  void setDpressed(boolean tf){
    dpressed=tf;
  }
  void setGravity(int g){
    gravity=g;
  }
  void setHealth(int h){
    health = h;
  }
  void setCoinsCollected(int c){
    coinscollected=c;
  }
  //jump() triggers when up is pressed.
  void jump(){
    setJumpsLeft(getJumpsLeft()-1);
    gravity=0;
  }
  void moveLeftRight(Terrain[] ts){//Moves Mario left and right
     if(apressed){
       move(-3,0);
       for(int i = 0;i<ts.length;i++){
          if(currentWorld[i].getXcor() >= 630){
          //regenerate at the right side with xcor = maxxcor
           currentWorld[i].setXcor(0);
        }
        ts[i].move(1,0);
         if(isInside(ts[i])){
           ts[i].rightTrigger(this);
         }
       }
     }
     if(dpressed){
       move(3,0);
       for(int i = 0;i<ts.length;i++){
        if(currentWorld[i].getXcor() <= 0){
          //regenerate at the right side with xcor = maxxcor
           currentWorld[i].setXcor(630);
        }
        ts[i].move(-1,0);
         if(isInside(ts[i])){
           ts[i].leftTrigger(this);
         }
       }
    }
  }
  //moveUpDown moves Mario either vertically up, or vertically down
  void moveUpDown(float groundheight, Terrain[] ts){
    gravity += .5;//((groundheight-itsame.getYcor())/38);//Readjusts gravity based on his height
    itsame.move(0,10-gravity);
    for(int i = 0;i<ts.length;i++){
         if(isInside(ts[i])){
           ts[i].upTrigger(this);
         }
       }
    if(itsame.getYcor()>groundheight){//If mario hits the ground
      itsame.move(0,itsame.getYcor()-groundheight);
      itsame.setJumpsLeft(2);
      gravity-=.5;
    }
  }
  public boolean isInside(Terrain m){
    return (getXcor()>m.getXcor()) && (getXcor()<m.getXcor()+m.getLength()) && (getYcor()>m.getYcor()-15) && (getYcor()<m.getYcor()+m.getHeight());
  }
  public void die(){
    setHealth(0);
    lost = true;
  }
  
}